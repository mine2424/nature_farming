import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        // StateNotifierProvider<TodoNotifier, TodoState>(
        //   create: (context) => TodoNotifier(
        //     context: context,
        //     initialFetch: true,
        //     receivedTodoList: [],
        //     listName: '',
        //   ),
        // ),
      ],
      child: const HomePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自然農'),
      ),
      body: Center(
        child: Text('farm'),
      ),
    );
  }
}
