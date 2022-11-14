import 'package:flutter/material.dart';
import 'package:test_project/cafe.dart';
import 'package:test_project/food.dart';

class restaurant extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<restaurant > {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('맛집 정보'),
        centerTitle: true, // 중앙 정렬
        elevation: 0.0,
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('category'),
            ),
            ListTile(
              title: const Text('음식점'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => food())
                );
              },
            ),
            ListTile(
              title: const Text('카페'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => cafe())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}