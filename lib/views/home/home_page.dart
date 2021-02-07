import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nature_farming/use_case/account/account_notifier.dart';
import 'package:nature_farming/use_case/account/account_state.dart';
import 'package:nature_farming/views/timeline/timeline/timeline.dart';
import 'package:nature_farming/views/widget/drawer/drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage._({Key key}) : super(key: key);
  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<AccountNotifier, AccountState>(
          create: (_) => AccountNotifier(),
        ),
      ],
      child: const HomePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<AccountNotifier>();
    final state = context.select((AccountState value) => value);
    return DefaultTabController(
      length: 3,
      child: (state.isLoading)
          ? const Scaffold(
              body: Center(child: Text('now Loading...')),
            )
          : Scaffold(
              appBar: AppBar(
                title: const Text('自然農'),
                backgroundColor: const Color(0xFFAACF52),
                bottom: const TabBar(
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.blue,
                  indicatorWeight: 3,
                  labelColor: Colors.black,
                  tabs: [
                    Tab(text: 'タイムライン'),
                    Tab(text: 'コミュニティー'),
                    Tab(text: 'ノウハウ（仮）'),
                  ],
                ),
              ),
              drawer:
                  drawer(context: context, notifier: notifier, state: state),
              body: TabBarView(
                children: [
                  TimeLinePage.wrapped(),
                  Container(),
                  Container(),
                ],
              ),
            ),
    );
  }
}
