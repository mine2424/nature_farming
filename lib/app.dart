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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('now loading...')));
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterBuild);
    super.initState();
  }

  @override
  void dispose() {
    print('dispose root');
    super.dispose();
  }

  Future<void> _afterBuild(Duration duration) async {
    final accountNotifier = context.read<AccountNotifier>();
    final loginResult = accountNotifier.startUp();
    // ignore: unrelated_type_equality_checks
    if (loginResult == true) {
      _showMainPage();
    } else {
      _showLoginPage();
    }
  }

  void _showMainPage() => Navigator.of(context, rootNavigator: true)
          .pushReplacement<MaterialPageRoute, void>(MaterialPageRoute(
        builder: (_) => HomePage(),
      ));

  void _showLoginPage() => Navigator.of(context, rootNavigator: true)
          .pushReplacement<MaterialPageRoute, void>(MaterialPageRoute(
        builder: (_) => OnBoardPage(),
      ));
}
