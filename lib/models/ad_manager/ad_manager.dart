import 'dart:io';

class AdManager {
  // アプリIDを返す関数
  static String get appId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-1047693745516593~5158597763';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-1047693745516593~6308027902';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  // 広告ユニットIDを返す関数
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-1047693745516593/9879994298';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-1047693745516593/2667185850';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
