/*
 * [Base64 Data Encodings](http://tools.ietf.org/html/rfc4648)
 */
library base64;


import 'dart:convert';
import 'package:cryptoutils/cryptoutils.dart';

final _EQ_RE = new RegExp(r'=');
final _PLUS_RE = new RegExp(r'\+');
final _SLASH_RE = new RegExp(r'\/');
final _MINUS_RE = new RegExp(r'\-');
final _US_RE = new RegExp(r'_');

/*
 * Convert a list of bytes to a base64 string.
 */
class Base64Encoder extends Converter<List<int>,String> {
  const Base64Encoder();

  @override
  String convert(List<int> input) => CryptoUtils.bytesToBase64(input);

  /*
   * Convert a base64 string to a base64url string.
   */
  String convertFromBase64String(String input) {
    return input.replaceAll(_EQ_RE, '') // remove the trailing padding.
    .replaceAll(_PLUS_RE, '-').replaceAll(_SLASH_RE, '_');
  }
}


/*
 * Convert a base64url sring to a list of bytes.
 */
class Base64Decoder extends Converter<String, List<int>> {
  static const _SEGMENT_LENGTH = 4;

  const Base64Decoder();

  @override
  List<int> convert(String input) {
    return CryptoUtils.base64StringToBytes(convertToBase64String(input));
  }

  /*
   * Convert a base66 sring to a base64 string.
   */
  String convertToBase64String(String input) {
    return _padString(input).replaceAll(_MINUS_RE, '+').replaceAll(_US_RE, '/');
  }

  String _padString(String input) {
    final diff = input.length % _SEGMENT_LENGTH;

    if (diff == 0) {
      return input;
    }

    var padLength = _SEGMENT_LENGTH - diff;

    final sb = new StringBuffer(input);

    while (padLength-- > 0) {
      sb.write('=');
    }

    return sb.toString();
  }
}
// class Base64Decoder extends Converter<List<int>,String> {
//   const Base64Decoder();

//   @override
//   List<int> convert(String input) => CryptoUtils.base64StringToBytes(input);
// }


/**
 *
 */
class Base64Codec extends Codec {
  const Base64Codec();

  @override
  Converter get encoder => const Base64Encoder();

  @override
  Converter get decoder => const Base64Decoder();
}


const BASE64 = const Base64Codec();