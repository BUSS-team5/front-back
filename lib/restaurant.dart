import 'package:flutter/material.dart'; //flutter의 package를 가져오는 코드 반드시 필요
import 'dart:async';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:toggle_switch/toggle_switch.dart';

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

  @override
  void dispose() // controller 해제
  {
    _buscontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('생활 지도'), centerTitle: true, elevation: 0.0),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                // 검색 위젯
                Expanded(
                  // 텍스트필드 생성
                  child: TextField(
                    controller: _buscontroller,
                  ),
                ),
                ElevatedButton(
                  // 검색 버튼 생성
                  onPressed: () {},
                  child: Text('검색'),
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
                      minWidth: 80.0,
                      minHeight: 40.0,
                      initialLabelIndex: 1,
                      cornerRadius:20.0,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      totalSwitches: 4,
                      icons: [
                        Icons.restaurant,
                        Icons.coffee,
                        Icons.house,
                        Icons.apartment,
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
