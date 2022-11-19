
import 'package:flutter/material.dart';

class house extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("부동산 정보"),
            centerTitle: true,
            bottom: new TabBar(
                isScrollable: true,
                indicator: BoxDecoration(
                    color: Colors.black26,
                    borderRadius:  BorderRadius.circular(25.0)
                ) ,
                tabs: [
                  new Tab(text: '원룸', icon: new Icon(Icons.house)),
                  new Tab(text: '투룸/빌라', icon: new Icon(Icons.apartment)),
                ]),
          ),
          body: new TabBarView(
            children: [
              new ListView(
                children: list,
              ),
              new ListView(
                children: list1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> list = <Widget>[
  new Divider(),
  new ListTile(
    title: new Text('이름 / 주소',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: new Text('리뷰',),
    leading: new Icon(
      Icons.restaurant,
      color: Colors.blue[500],
    ),
  ),
  new Divider(),
  new ListTile(
    title: new Text('이름 / 주소',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: new Text('리뷰'),


    leading: new Icon(
      Icons.restaurant,
      color: Colors.blue[500],
    ),
  ),
  new Divider(),
  new ListTile(
    title: new Text('이름 / 주소',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: new Text('리뷰',),
    leading: new Icon(
      Icons.restaurant,
      color: Colors.blue[500],
    ),
  ),
  new Divider(),
  new ListTile(
    title: new Text('이름 / 주소',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: new Text('리뷰',),
    leading: new Icon(
      Icons.restaurant,
      color: Colors.blue[500],
    ),
  ),
];

List<Widget> list1 = <Widget>[
  new Divider(),
  new ListTile(
    title: new Text('이름 / 주소',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: new Text('리뷰',),
    leading: new Icon(
      Icons.restaurant,
      color: Colors.blue[500],
    ),
  ),
  new Divider(),
  new ListTile(
    title: new Text('이름 / 주소',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: new Text('리뷰',),
    leading: new Icon(
      Icons.restaurant,
      color: Colors.blue[500],
    ),
  ),
  new Divider(),
  new ListTile(
    title: new Text('이름 / 주소',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: new Text('리뷰',),
    leading: new Icon(
      Icons.restaurant,
      color: Colors.blue[500],
    ),
  ),
  new Divider(),
  new ListTile(
    title: new Text('이름 / 주소',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: new Text('리뷰',),
    leading: new Icon(
      Icons.restaurant,
      color: Colors.blue[500],
    ),
  ),
];

void main() {
  runApp(new house());
}