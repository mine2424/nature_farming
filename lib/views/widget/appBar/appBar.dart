import 'package:flutter/material.dart';

AppBar appBar(BuildContext context, String title, bool centerTitle) {
  return AppBar(
    title: Text(title),
    backgroundColor: const Color(0xFFAACF52),
    actions: [],
    centerTitle: centerTitle,
    // leading: leading,
  );
}
