import 'package:flutter/material.dart';

SizedBox space({double height, double width}) {
  if (width == null) {
    SizedBox(
      height: height * 8,
    );
  } else {
    SizedBox(
      width: width * 8,
    );
  }
}
