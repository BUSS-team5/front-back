import 'package:flutter/material.dart';
import 'package:test_project/tworoom.dart';

class oneroom extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<oneroom> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('원룸'),
        centerTitle: true, // 중앙 정렬
        elevation: 0.0,
      ),
    );
  }
}
