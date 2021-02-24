import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flutter/material.dart';
import 'package:nature_farming/app.dart';
import 'package:nature_farming/models/ad_manager/ad_manager.dart';

BannerAd myBanner;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flamingo.initializeApp();
  await FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  myBanner = BannerAd(
    // adUnitId: BannerAd.testAdUnitId, // テスト用
    adUnitId: AdManager.bannerAdUnitId, // 本番用
    size: AdSize.smartBanner,
    listener: (MobileAdEvent event) {
      print('BannerAd event is $event');
    },
  );
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(App());
}

/// To verify things are working, check out the native platform logs.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
}
