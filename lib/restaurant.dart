import 'package:flutter/material.dart';
import 'dart:async';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:test_project/list.dart';

class restaurant extends StatefulWidget {
  @override
  State<restaurant> createState() => _MyAppState();
}

class _MyAppState extends State<restaurant> with TickerProviderStateMixin {
  late TabController _tabController;
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

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
      //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 앱바
        title: Text('맛집 정보'), // 앱바 title
        centerTitle: true, // 중앙 정렬
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: TabBar(
              tabs: [
                Container(
                  height: 40,
                  alignment: Alignment.center,

                  child: Text(
                    '카페',
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    '음식점',
                  ),
                ),
              ],
              indicator: BoxDecoration(
                gradient: LinearGradient(
                  //배경 그라데이션 적용
                  begin: Alignment.centerRight,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black12,
                    Colors.black,
                  ],
                ),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              controller: _tabController,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                SizedBox(
                  // 지도 생성
                  height: 500,
                  child: NaverMap(
                    onMapCreated: onMapCreated,
                    useSurface: true,
                    mapType: _mapType,
                    locationButtonEnable: true,
                    indoorEnable: true,
                    initLocationTrackingMode: LocationTrackingMode.NoFollow,
                    initialCameraPosition: _initialPosition,
                  ),
                ),
                SizedBox(
                  // 지도 생성
                  height: 500,
                  child: NaverMap(
                    onMapCreated: onMapCreated,
                    useSurface: true,
                    mapType: _mapType,
                    locationButtonEnable: true,
                    indoorEnable: true,
                    initLocationTrackingMode: LocationTrackingMode.NoFollow,
                    initialCameraPosition: _initialPosition,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ListTile(
                  // 2. 리스트 항목 추가하면 끝!
                  leading: Icon(Icons.map),
                  title: Text('지도'),
                  onTap: () => _showDialog(context, '지도'),
                ),
                ListTile(
                  // 2. 리스트 항목 추가하면 끝!
                  leading: Icon(Icons.map),
                  title: Text('지ddddddddddddddddddddd3도'),
                  onTap: () => _showDialog(context, '지도'),
                ),
              ],
            ),
          ),
        ],
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
        });
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}

void main() {
  runApp(new restaurant());
}
