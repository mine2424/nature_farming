import 'package:flutter/material.dart';
import 'package:nature_farming/views/timeline/timeline.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  // const HomePage._({Key key}) : super(key: key);

  // static Widget wrapped() {
  //   return MultiProvider(
  //     providers: [
  // StateNotifierProvider<TodoNotifier, TodoState>(
  //   create: (context) => TodoNotifier(
  //     context: context,
  //     initialFetch: true,
  //     receivedTodoList: [],
  //     listName: '',
  //   ),
  // ),
  //     ],
  //     child: const HomePage._(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text('自然農'),
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
          // TODO(mine2424): create Drawer.
          // drawer: ,
          body: TabBarView(
            children: [
              TimeLinePage(),
              Container(),
              Container(),
            ],
          )),
    );
  }
}
