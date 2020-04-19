import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

iAppBrowser inAppBrowserFallback = new iAppBrowser();
class iAppBrowser extends InAppBrowser
{
  @override
  Future onLoadStart(String url) async
  {
    print("\n\nStarted $url\n\n");
  }

  @override
  Future onLoadStop(String url) async
  {
    print("\n\nStopped $url\n\n");
  }

  @override
  void onLoadError(String url, int code, String message)
  {
    print("\n\nCan't load $url.. Error: $message\n\n");
  }

  @override
  void onExit()
  {
    print("\n\nBrowser closed!\n\n");
  }
}

iChromeSafariBrowser chromeSafariBrowser = new iChromeSafariBrowser(inAppBrowserFallback);
class iChromeSafariBrowser extends ChromeSafariBrowser {

  iChromeSafariBrowser(browserFallback); // : super(browserFallback);

  @override
  void onOpened() {
    print("ChromeSafari browser opened");
  }

  @override
  void onLoaded() {
    print("ChromeSafari browser loaded");
  }

  @override
  void onClosed() {
    print("ChromeSafari browser closed");
  }
}