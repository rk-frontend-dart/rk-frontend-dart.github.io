// Copyright (c) 2013-present, Iván Zaera Avellón - izaera@gmail.com

// This library is dually licensed under LGPL 3 and MPL 2.0. See file LICENSE for more information.

// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of
// the MPL was not distributed with this file, you can obtain one at http://mozilla.org/MPL/2.0/.

library cipher.modes.sic;

import "dart:typed_data";

// Lab_RekanKerjaku_FrontEnd/sources/

import "package:Lab_RekanKerjaku_FrontEnd/sources/cipher/api.dart";
import "package:Lab_RekanKerjaku_FrontEnd/sources/cipher/src/ufixnum.dart";
import "package:Lab_RekanKerjaku_FrontEnd/sources/cipher/params/parameters_with_iv.dart";
import "package:Lab_RekanKerjaku_FrontEnd/sources/cipher/stream/base_stream_cipher.dart";
// import "package:cipher/api.dart";
// import "package:cipher/src/ufixnum.dart";
// import "package:cipher/params/parameters_with_iv.dart";
// import "package:cipher/stream/base_stream_cipher.dart";

/**
 * NOTE: the implementation of SIC/CTR mode of operation as a [BlockCipher] is done using a [StreamCipherAsBlockCipher] adapter
 * (see file [package:cipher/adapters/stream_cipher_adapters.dart] for more info).
 */

/**
 * Implementation of SIC mode of operation as a [StreamCipher]. This implementation uses the IV as the initial nonce value and
 * keeps incrementing it by 1 for every new block. The counter may overflow and rotate, and that would cause a two-time-pad
 * error, but this is so unlikely to happen for usual block sizes that we don't check for that event. It is the responsibility
 * of the caller to make sure the counter does not overflow.
 */
class SICStreamCipher extends BaseStreamCipher {

  final BlockCipher underlyingCipher;

  Uint8List _iv;
  Uint8List _counter;
  Uint8List _counterOut;
  int _consumed;

  SICStreamCipher(this.underlyingCipher) {
    _iv = new Uint8List(underlyingCipher.blockSize);
    _counter = new Uint8List(underlyingCipher.blockSize);
    _counterOut = new Uint8List(underlyingCipher.blockSize);
  }

  String get algorithmName => "${underlyingCipher.algorithmName}/SIC";

  void reset() {
    underlyingCipher.reset();
    _counter.setAll( 0, _iv );
    _counterOut.fillRange( 0, _counterOut.length, 0 );
    _consumed = _counterOut.length;
  }

  // void init(bool forEncryption, ParametersWithIV params) {
  void init(bool forEncryption, CipherParameters paramsVal) {
    ParametersWithIV params = paramsVal;
    _iv.setAll( 0, params.iv );
    reset();
    underlyingCipher.init( true, params.parameters );
  }

  void processBytes(Uint8List inp, int inpOff, int len, Uint8List out, int outOff) {
    for( var i=0 ; i<len ; i++ ) {
      out[outOff+i] = returnByte( inp[inpOff+i] );
    }
  }

  int returnByte(int inp) {
    _feedCounterIfNeeded();
    return clip8(inp) ^ _counterOut[_consumed++];
  }

  /// Calls [_feedCounter] if all [_counterOut] bytes have been consumed
  void _feedCounterIfNeeded() {
    if( _consumed>=_counterOut.length ) {
      _feedCounter();
    }
  }

  /**
   * Fills [_counterOut] with a new value got from encrypting [_counter] with
   * the [_underlyingCipher], resets [_consumed] to 0 and increments the
   * [_counter].
   */
  void _feedCounter() {
    underlyingCipher.processBlock( _counter, 0, _counterOut, 0 );
    _incrementCounter();
    _consumed = 0;
  }

  /// Increments [_counter] by 1
  void _incrementCounter() {
    var i;
    for( i=_counter.lengthInBytes-1 ; i>=0 ; i-- )
    {
      var val = _counter[i];
      val++;
      _counter[i] = val;
      if( _counter[i]!=0 ) break;
    }
  }

}

/// Just an alias to be able to create SIC as CTR
class CTRStreamCipher extends SICStreamCipher {
  CTRStreamCipher(BlockCipher underlyingCipher) : super(underlyingCipher);
  String get algorithmName => "${underlyingCipher.algorithmName}/CTR";
}