import 'package:flutter/material.dart';
import 'package:nature_farming/common/color/color.dart';

AppBar appBar(BuildContext context, String title, bool centerTitle) {
  return AppBar(
    title: Text(title),
    backgroundColor: AppColor.mainColor,
    actions: [],
    centerTitle: centerTitle,
    // leading: leading,
  );
}
