import 'package:flutter/material.dart'; //flutter의 package를 가져오는 코드 반드시 필요
import 'dart:async';
import 'package:naver_map_plugin/naver_map_plugin.dart';
// 페이지 호출
class bus_route extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// 페이지 생성
class _MyAppState extends State<bus_route> {

  var _buscontroller = TextEditingController();                   // controller 연결
  Completer<NaverMapController> _controller = Completer();        // 컨트롤러 생성자
  MapType _mapType = MapType.Basic;                               // 지도 타입 = 베이직 타입
  final CameraPosition _initialPosition = new CameraPosition(     // 띄웠을 떄 첫 좌표
    target: LatLng(36.14578, 128.39278),
  );

  List<String> dropdownList1 = ['옥계', '신평', '어쩌고'];
  String selectedDropdown1 = '1';

  List<String> dropdownList2 = ['191', '192', '194'];
  String selectedDropdown2 = '1';

  @override
  void dispose() // controller 해제
  {
    _buscontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(                   // 앱바
        title: Text('버스 노선 정보'),    // 앱바 title
        centerTitle: true,              // 중앙 정렬
        elevation: 0.0,
      ),
      body:                                                 // 바디
       SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(                                             // 세로 배치
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(children: <Widget>[               // 검색 위젯
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
              SizedBox(                             // 지도 생성
                height: 300,
                child: NaverMap(
                  onMapCreated: onMapCreated,
                  useSurface: true,
                  mapType: _mapType,
                  locationButtonEnable: true,
                  indoorEnable: true,
                  initLocationTrackingMode: LocationTrackingMode.NoFollow,
                  initialCameraPosition: _initialPosition,
                  markers: <Marker>[                             // 마커 생성
                    Marker(
                        markerId: '대학원생 나현진',
                        position: LatLng(36.14578, 128.39278)
                    ),
                  ],
                ),
              ),
              ListTile(                           // 2. 리스트 항목 추가하면 끝!
                leading: Icon(Icons.map),
                title: Text('지도'),
                onTap: () => _showDialog(context, '지도'),
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('사진'),
                onTap: () => _showDialog(context, '사진'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('전화'),
                enabled: false,                             // 비활성
                onTap: () => _showDialog(context, '전화'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('전화'),
                enabled: false,                             // 비활성
                onTap: () => _showDialog(context, '전화'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('전화'),
                enabled: false,                             // 비활성
                onTap: () => _showDialog(context, '전화'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('전화'),
                enabled: false,                             // 비활성
                onTap: () => _showDialog(context, '전화'),
              ),
            ],
          ),
        ),
    );

  }
  void _showDialog(BuildContext context, String text) {
    // 경고창을 보여주는 가장 흔한 방법.
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('선택 완료!'),
            content: Text('$text 항목을 선택했습니다.'),
            // 주석으로 막아놓은 actions 매개변수도 확인해 볼 것.
            // actions: <Widget>[
            //     FlatButton(child: Text('확인'), onPressed: () => Navigator.pop(context)),
            // ],
          );
        }
    );
  }
  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}
