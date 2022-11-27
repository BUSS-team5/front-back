import 'package:flutter/material.dart'; //flutter의 package를 가져오는 코드 반드시 필요
import 'dart:async';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:toggle_switch/toggle_switch.dart';
//import 'firebase_options.dart';   // **파이어베이스 연동하기
//import 'package:cloud_firestore/cloud_firestore.dart';  // **파이어베이스 연동하기

// 페이지 호출
class restaurant extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// 페이지 생성
class _MyAppState extends State<restaurant> {
  var _buscontroller = TextEditingController(); // controller 연결
  Completer<NaverMapController> _controller = Completer(); // 컨트롤러 생성자
  MapType _mapType = MapType.Basic; // 지도 타입 = 베이직 타입

  final CameraPosition _initialPosition = new CameraPosition(
    // 띄웠을 떄 첫 좌표
    target: LatLng(36.14578, 128.39278),
  );

  List<String> dropdownList1 = ['옥계', '구미역','터미널'];
  String selectedDropdown1 = '옥계';

  List<String> dropdownList2 = ['191', '192', '194'];
  String selectedDropdown2 = '191';

  @override
  void dispose() // controller 해제
  {
    _buscontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('생활 지도'),
            centerTitle: true, elevation: 0.0
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                // 검색 위젯
                DropdownButton(
                  value: selectedDropdown1,
                  items: dropdownList1.map((String item) {
                    return DropdownMenuItem<String>(
                      child: Text('$item'),
                      value: item,
                    );
                  }).toList(),
                  onChanged: (dynamic value) {
                    setState(() {
                      selectedDropdown1 = value;
                    });
                  },
                ),
                DropdownButton(
                  value: selectedDropdown2,
                  items: dropdownList2.map((String item) {
                    return DropdownMenuItem<String>(
                      child: Text('$item'),
                      value: item,
                    );
                  }).toList(),
                  onChanged: (dynamic value) {
                    setState(() {
                      selectedDropdown2 = value;
                    });
                  },
                ),
              ]),
              Stack(
                  children: <Widget> [
                    SizedBox(
                      height: 500,
                      child: NaverMap(
                        onMapCreated: onMapCreated,
                        useSurface: true,
                        mapType: _mapType,
                        locationButtonEnable: true,
                        indoorEnable: true,
                        initLocationTrackingMode: LocationTrackingMode.NoFollow,
                        initialCameraPosition: _initialPosition,
                        markers: <Marker>[
                          // 마커 생성
                          Marker(
                              markerId: '대학원생 나현진',
                              position: LatLng(36.14578, 128.39278)
                          ),
                        ],
                      ),
                    ),
                    Container(
                        padding:EdgeInsets.all(20),
                        child: ToggleSwitch(
                          minWidth: 60.0,
                          minHeight: 40.0,
                          initialLabelIndex: 1,
                          cornerRadius:20.0,
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          totalSwitches: 3,
                          icons: [
                            Icons.restaurant,
                            Icons.coffee,
                            Icons.house,
                          ],
                          iconSize: 20.0,
                          activeBgColor: [Colors.blue],
                          onToggle: (index){
                            print('swiched to: $index');
                          },
                        )
                    )
                  ]
              ),
            ],
          ),
        )
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}