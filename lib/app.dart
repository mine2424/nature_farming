import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:nature_farming/views/onboard/onBoard_page.dart';
import 'package:provider/provider.dart';
import 'package:nature_farming/views/home/home_page.dart';
import 'package:nature_farming/use_case/account/account_notifier.dart';

import 'di_container.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...useCaseProviders],
      child: MaterialApp(
        title: '自然農民',
        debugShowCheckedModeBanner: false,
        home: RootPage(),
      ),
    );
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  // FirebaseMessaging _firebaseMessaging;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('now loading...')));
  }

  @override
  void initState() {
    _pushNotificationConfigure();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterBuild);
  }

  @override
  void dispose() {
    print('dispose root');
    super.dispose();
  }

  void _pushNotificationConfigure() {
    FirebaseMessaging()
      ..requestNotificationPermissions()
      ..onIosSettingsRegistered.listen(
        (IosNotificationSettings settings) {
          const IosNotificationSettings(
            sound: true,
            badge: true,
            alert: true,
          );
        },
      )
      ..configure(
        onBackgroundMessage:
            Platform.isAndroid ? myBackgroundMessageHandler : null,
        onMessage: (Map<String, dynamic> message) async {
          print('onMessage: $message');
          // final pnm = PushNotificationMessage.fromJson(message);
          // showSimpleNotification(
          //   Text(
          //     pnm.title,
          //     style: const TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 18,
          //     ),
          //   ),
          //   subtitle: Text(pnm.body),
          //   background: kAppBlue100,
          // );
        },
        onResume: (Map<String, dynamic> message) async {
          print('onResume: $message');
        },
        onLaunch: (Map<String, dynamic> message) async {
          print('onLaunch: $message');
        },
      );

    // ignore: cascade_invocations
    // _firebaseMessaging.subscribeToTopic('all');
  }

  Future<void> _afterBuild(Duration duration) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    final accountNotifier = context.read<AccountNotifier>();
    final loginResult = accountNotifier.startUp();
    // ignore: unrelated_type_equality_checks
    if (loginResult == true) {
      _showMainPage();
    } else {
      _showLoginPage();
    }
  }

  Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // データメッセージをハンドリング
      final dynamic data = message['data'];
      print(data);
    }

    if (message.containsKey('notification')) {
      // 通知メッセージをハンドリング
      final dynamic notification = message['notification'];
      print(notification);
    }
    print('onBackground: $message');
  }

  void _showMainPage() => Navigator.of(context, rootNavigator: true)
          .pushReplacement<MaterialPageRoute, void>(MaterialPageRoute(
        builder: (_) => HomePage(),
      ));

  void _showLoginPage() => Navigator.of(context, rootNavigator: true)
          .pushReplacement<MaterialPageRoute, void>(MaterialPageRoute(
        builder: (_) => OnBoardPage.wrapped(),
      ));
}
