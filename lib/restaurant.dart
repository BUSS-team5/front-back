
import 'package:flutter/material.dart';

class restaurant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("맛집 정보"),
            centerTitle: true,
            bottom: new TabBar(
                isScrollable: true,
                indicator: BoxDecoration(
                    color: Colors.black26,
                    borderRadius:  BorderRadius.circular(25.0)
                ) ,
                tabs: [
                  new Tab(text: '카페', icon: new Icon(Icons.local_cafe)),
                  new Tab(text: '음식점', icon: new Icon(Icons.restaurant_menu)),
                ]),
          ),
          body: new TabBarView(
            children: [
              new ListView(
                children: list,
              ),
              new ListView(
                children: Twolist,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> list = <Widget>[
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
    subtitle: new Text('리뷰'),
    leading: new Icon(
      Icons.restaurant,
      color: Colors.blue[500],
    ),
  ),
];

List<Widget> Twolist = <Widget>[
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
];

void main() {
  runApp(new restaurant());
}