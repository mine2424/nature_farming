import 'package:flutter/material.dart';
import 'package:nature_farming/views/home/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage.wrapped(),
    );
  }
}
