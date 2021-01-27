import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nature_farming/common/color/color.dart';
import 'package:nature_farming/use_case/sns/sns_notifier.dart';
import 'package:nature_farming/use_case/sns/sns_state.dart';
import 'package:nature_farming/views/timeline/list_item/list_item.dart';
import 'package:nature_farming/views/widget/dialog/post_dialog.dart';
import 'package:provider/provider.dart';

class TimeLinePage extends StatelessWidget {
  const TimeLinePage._({Key key}) : super(key: key);
  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<SnsNotifier, SnsState>(
          create: (context) => SnsNotifier(),
        ),
      ],
      child: const TimeLinePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<SnsNotifier>();
    return Scaffold(
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return listItem(context, index, notifier);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: AppColor.mainColor,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => PostDialog.wrapped(),
                fullscreenDialog: true,
              ));
        },
      ),
    );
  }
}
