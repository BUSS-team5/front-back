import 'package:flutter/material.dart'; //flutter의 package를 가져오는 코드 반드시 필요
import 'dart:async';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class bus_route extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<bus_route> {
  var _buscontroller = TextEditingController(); // controller 연결
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;
  final CameraPosition _initialPosition = new CameraPosition(
    target: LatLng(36.14578, 128.39278),
  );

  @override
  void dispose() // controller 해제
  {
    _buscontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('버스 노선 정보'),
        centerTitle: true, // 중앙 정렬
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _buscontroller,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('번호 검색'),
              ),
            ]),

            SizedBox(
              height: 300,
              child: NaverMap(
                onMapCreated: onMapCreated,
                useSurface: true,
                mapType: _mapType,
                locationButtonEnable: true,
                indoorEnable: true,
                initLocationTrackingMode: LocationTrackingMode.NoFollow,
                initialCameraPosition: _initialPosition,
                markers: <Marker>[
                  Marker(
                      markerId: '대학원생 김재원',
                      position: LatLng(36.14578, 128.39278)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}
