import 'package:flutter/material.dart';
import 'package:test_project/tworoom.dart';

class food extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<food> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('음식'),
        centerTitle: true, // 중앙 정렬
        elevation: 0.0,
      ),
    );
  }
}
