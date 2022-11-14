import 'package:flutter/material.dart';
import 'package:test_project/tworoom.dart';

class tworoom extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<tworoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('투룸/빌라'),
        centerTitle: true, // 중앙 정렬
        elevation: 0.0,
      ),
    );
  }
}
