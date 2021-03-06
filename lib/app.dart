import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:nature_farming/use_case/account/account_state.dart';
import 'package:nature_farming/views/onboard/onBoard_page.dart';
import 'package:provider/provider.dart';
import 'package:nature_farming/views/home/home_page.dart';
import 'package:nature_farming/use_case/account/account_notifier.dart';

import 'common/type/types.dart';
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

  Future<void> _pushNotificationConfigure() async {
    await FirebaseMessaging.instance.getInitialMessage().then(
      (RemoteMessage message) {
        if (message != null) {
          print('get initialMessage : $message');
        }
      },
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      final android = message.notification?.android;
      if (notification != null && android != null) {
        print('onMessaging : $message');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
    });

    final notifier = context.read<AccountNotifier>();
    final token = FirebaseMessaging.instance.getToken();
    notifier.saveMessagingToken(token.toString());
    // ignore: cascade_invocations
    // _firebaseMessaging.subscribeToTopic('all');
  }

  Future<void> _afterBuild(Duration duration) async {
    // TODO(mine2424): メンテナンスでアプリを使えない様にする（機能別で）
    // TODO(mine2424): ひな恋チャットも同じような実装をする。
    await Future<void>.delayed(const Duration(seconds: 1));

    final accountNotifier = context.read<AccountNotifier>();
    //awaitをつけないとFutureが付きっぱなしになる。
    final loginResult = await accountNotifier.startUp();
    // ignore: unrelated_type_equality_checks
    if (loginResult == StartUpType.loggedInUser) {
      print('true');
      if (!Provider.of<AccountState>(context, listen: false).isLoading) {
        _showMainPage();
      }
    } else {
      print('fuck false');
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
        builder: (_) => HomePage.wrapped(),
      ));

  void _showLoginPage() => Navigator.of(context, rootNavigator: true)
          .pushReplacement<MaterialPageRoute, void>(MaterialPageRoute(
        builder: (_) => OnBoardPage.wrapped(),
      ));
}
