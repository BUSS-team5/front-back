
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class restaurant extends StatefulWidget {
  @override
  State<restaurant> createState() => _MyAppState();
}

class _MyAppState extends State<restaurant> {
  var _buscontroller = TextEditingController(); // controller 연결
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;
  final CameraPosition _initialPosition = new CameraPosition(
    target: LatLng(36.14578, 128.39278),
  );

  List<String> dropdownList = ['옥계방면', '구미역방면'];
  String selectedDropdown = '옥계방면';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(                   // 앱바
        title: Text('맛집 정보'),        // 앱바 title
        centerTitle: true,              // 중앙 정렬
        elevation: 0.0,
      ),
      body:
        Stack(
          children: <Widget> [
            NaverMap(
              onMapCreated: onMapCreated,
              useSurface: true,
              mapType: _mapType,
              locationButtonEnable: true,
              indoorEnable: true,
              initLocationTrackingMode: LocationTrackingMode.NoFollow,
              initialCameraPosition: _initialPosition,
            ),
            
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              color: Colors.white,
              child: DropdownButton(
                value: selectedDropdown,
                items: dropdownList.map((String item) {
                  return DropdownMenuItem<String>(
                    child: Text('$item'),
                    value: item,
                  );
                }).toList(),
                onChanged: (dynamic value) {
                  setState(() {
                    selectedDropdown = value!;
                  });
                },
              ),
            ),
          ],
        )
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
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

];

void main() {
  runApp(new restaurant());
}