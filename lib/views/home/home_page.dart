import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nature_farming/common/color/color.dart';
import 'package:nature_farming/use_case/account/account_notifier.dart';
import 'package:nature_farming/use_case/account/account_state.dart';
import 'package:nature_farming/views/home/home_page_state.dart';
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
        StateNotifierProvider<HomePageNotifier, HomePageState>(
          create: (context) => HomePageNotifier(context),
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
          ? const Scaffold(body: Center(child: Text('now Loading...')))
          : Scaffold(
              appBar: AppBar(
                title: const Text('自然農'),
                backgroundColor: const Color(0xFFAACF52),
                bottom: TabBar(
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Color(0xFF667D23),
                  indicatorWeight: 3,
                  labelColor: Colors.black,
                  tabs: const [
                    Tab(text: 'タイムライン'),
                    Tab(text: '検討中'),
                    Tab(text: '検討中'),
                  ],
                ),
              ),
              drawer:
                  drawer(context: context, notifier: notifier, state: state),
              body: TabBarView(
                children: [
                  TimeLinePage.wrapped(),
                  questionnaireWidget(context),
                  questionnaireWidget(context),
                ],
              ),
            ),
    );
  }

  Widget questionnaireWidget(BuildContext context) {
    final notifier = context.watch<HomePageNotifier>();
    final state = context.select((HomePageState value) => value);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 16),
          const ListTile(
            leading: Icon(Icons.label),
            title: Text('アンケート'),
            subtitle: Text('こんな機能が欲しい！などのご要望をお待ちしています。'),
          ),
          const SizedBox(height: 8),
          const Divider(height: 1.5),
          const SizedBox(height: 8),
          ListTile(
            leading: Icon(Icons.person),
            title: TextField(
              decoration: InputDecoration(hintText: 'Name'),
              onChanged: (value) => notifier.saveContent(value),
            ),
          ),
          ListTile(
            leading: Icon(Icons.note),
            title: TextField(
              decoration: InputDecoration(hintText: '内容'),
              onChanged: (value) => notifier.saveName(value),
            ),
          ),
          const SizedBox(height: 16),
          FlatButton(
            onPressed: () async {
              await notifier.sendQuestionnaire();
            },
            shape: const StadiumBorder(),
            color: AppColor.mainColor,
            child: const Text(
              '送信',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          const SizedBox(height: 24),
          if (state.isLoading)
            Center(
              child: Row(
                children: const [
                  Text('送信しました。'),
                  Text('ご協力ありがとうございます！'),
                ],
              ),
            )
        ],
      ),
    );
  }
}
