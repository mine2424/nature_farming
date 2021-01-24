import 'package:flutter/material.dart';
import 'package:nature_farming/common/color/color.dart';
import 'package:nature_farming/views/timeline/list_item/list_item.dart';

class TimeLinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: listItem,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: AppColor.mainColor,
        onPressed: () {},
      ),
    );
  }
}
