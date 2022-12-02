import 'package:flutter/material.dart'; //flutter의 package를 가져오는 코드 반드시 필요
import 'dart:async';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';  // **파이어베이스 연동하기

class Cafe{
  int? review;
  String? name;
  String? distance;
  String? holiday;
  String? number;
  GeoPoint? latlng;
  String? address;

  Cafe({this.review, this.name, this.distance, this.holiday, this.number, this.latlng, this.address});

  Cafe.fromJson(Map<String, dynamic>? json){
    var temp;

    if(json?["review"] is String){
      temp = int.tryParse(json?["review"] ?? "");
    }

    review = temp ?? 0;
    name = json?['name'] ?? "";
    distance = json?['distance'] ?? "";
    holiday = json?['holiday'] ?? "";
    number = json?['number'] ?? "";
    latlng = json?['position'] ?? GeoPoint(0, 0);
    address = json?['address'] ?? "";
  }

  Cafe.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) : this.fromJson(snapshot.data());

  Cafe.fromQuerySnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) : this.fromJson(snapshot.data());
}

class CafeService{
  static final CafeService _cafeService = CafeService._internal();

  factory CafeService() => _cafeService;

  CafeService._internal();

  Future<List<Cafe>> getCafe(int cnt, String route) async{
    CollectionReference<Map<String, dynamic>>? _collection = FirebaseFirestore.instance.collection('dataset/${route}/카페');
    if(cnt == 0){
      _collection = FirebaseFirestore.instance.collection('dataset/${route}/음식점');
    }
    else{
      _collection = FirebaseFirestore.instance.collection('dataset/${route}/카페');
    }
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _collection.get();

    List<Cafe> cafes = [];
    for(var doc in querySnapshot.docs){
      Cafe cafemodel = Cafe.fromQuerySnapshot(doc);
      cafes.add(cafemodel);
    }

    //cafes = querySnapshot.docs.map((e) => Cafe.fromJson(e.data())).toList();
    //print(cafes.length);
    return cafes;
  }
}

class Land{
  int? a;
  int? b;
  GeoPoint? latlng;

  Land({this.a, this.b, thislatlng});

  Land.fromJson(Map<String, dynamic>? json){
    a = json?['보증금'] ?? 0;
    b = json?['월세'] ?? 0;
    latlng = json?['주소'] ?? GeoPoint(0, 0);
  }

  Land.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) : this.fromJson(snapshot.data());
  Land.fromQuerySnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) : this.fromJson(snapshot.data());
}

class LandService{
  static final LandService _landService = LandService._internal();

  factory LandService() => _landService;

  LandService._internal();

  Future<List<Land>> getland(String route) async {
    CollectionReference<Map<String, dynamic>> _collection = FirebaseFirestore.instance.collection('dataset/${route}/부동산');
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _collection.get();

    List<Land> lands = [];
    for(var doc in querySnapshot.docs){
      Land landmodel = Land.fromQuerySnapshot(doc);
      lands.add(landmodel);
    }
    return lands;
  }
}



// 페이지 호출
class restaurant extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

CameraPosition? _AfterPosition;

// 페이지 생성
class _MyAppState extends State<restaurant> {
  var _buscontroller = TextEditingController(); // controller 연결

  Completer<NaverMapController> _controller = Completer(); // 컨트롤러 생성자
  CameraPosition? _initialPosition;
  MapType _mapType = MapType.Basic; // 지도 타입 = 베이직 타입

  late Future myFuture;
  var idx = 0;

  List<Marker> temp = [];

  List<String> dropdownList1 = ['구미역', '금오공대종점','롯데마트','삼구아파트',
                              '신평시장','비산벽산아파트','오성예식장앞','옥계중학교'];
  String selectedDropdown1 = '구미역';


  getland(String route) async{
    Future<List<Land>> testlist = LandService().getland(route);
    List<Land> _list = [];
    temp.clear();
    _list = await testlist;
    for(int i = 0; i < _list.length; i++){
      if(i == 0){
        var lat = _list[i].latlng?.latitude ?? 0;
        var lng = _list[i].latlng?.longitude ?? 0;
        _AfterPosition = CameraPosition(target: LatLng(lat, lng));
        //print(_initialPosition);
      }

      temp.add(Marker(
        markerId: i.toString(),
        position: LatLng(_list[i].latlng!.latitude, _list[i].latlng!.longitude),
        captionText: "${_list[i].b}/${_list[i].a}",
      ));
      print("${_list[i].latlng!.latitude}, ${_list[i].latlng!.longitude}");
    }
    return _list[0].latlng;
  }

  getcafe(int cnt, String route) async {
    Future<List<Cafe>> _testlist = CafeService().getCafe(cnt, route);
    List<Cafe> _cafes = [];
    temp.clear();
    _cafes = await _testlist;
    for(int i = 0; i < _cafes.length; i++){
      if(i == 0){
        var lat = _cafes[i].latlng?.latitude ?? 0;
        var lng = _cafes[i].latlng?.longitude ?? 0;
        _AfterPosition = CameraPosition(target: LatLng(lat, lng));
      }
      if(_cafes[i].distance == '100'){
        temp.add(Marker(
          markerId: _cafes[i].name!,
          position: LatLng(_cafes[i].latlng!.latitude, _cafes[i].latlng!.longitude),
          captionText: _cafes[i].name!,
          //iconTintColor: Color.fromARGB(a, r, g, b)
        ));
      }
      if(_cafes[i].distance == '300'){
        temp.add(Marker(
          markerId: _cafes[i].name!,
          position: LatLng(_cafes[i].latlng!.latitude, _cafes[i].latlng!.longitude),
          captionText: _cafes[i].name!,
          //iconTintColor: Color.fromARGB(a, r, g, b)
         // onMarkerTab: _onMarkerTap(),
        ));
      }
      if(_cafes[i].distance == '500'){
        temp.add(Marker(
          markerId: _cafes[i].name!,
          position: LatLng(_cafes[i].latlng!.latitude, _cafes[i].latlng!.longitude),
          captionText: _cafes[i].name!,
          //iconTintColor: Color.fromARGB(a, r, g, b)
        ));
      }
    }
    return _cafes[0].latlng;
  }

  getdata(int cnt, String route) async {
    if(cnt == 0){
      await getcafe(cnt, route);
    }
    if(cnt == 1){
      await getcafe(cnt, route);
    }
    if(cnt == 2){
      await getland(route);
    }
    _goToNewPosition();
    return temp.length;
  }

  @override
  void dispose() // controller 해제
  {
    _buscontroller.dispose();
    super.dispose();
  }

  void initState(){
    super.initState();
    myFuture = getdata(0, '구미역');
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
                    setState((){
                      selectedDropdown1 = value;
                      // _goToNewPosition();
                    });
                  },
                ),
              ]),
              Stack(
                  children: <Widget> [
                    FutureBuilder(
                        future: myFuture,
                        builder: (BuildContext context, AsyncSnapshot snapshot){
                          if(snapshot.hasData == false){
                            return CircularProgressIndicator();
                          }
                          else if(snapshot.hasError){
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Error: ${snapshot.error}'
                                ),
                            );
                          }
                          else{
                            return SizedBox(
                              height: 550,
                              child: NaverMap(
                                onMapCreated: onMapCreated,
                                useSurface: true,
                                mapType: _mapType,
                                locationButtonEnable: true,
                                indoorEnable: true,
                                initLocationTrackingMode: LocationTrackingMode.NoFollow,
                                initialCameraPosition: CameraPosition(target: LatLng(36.12860209326003,128.33222703225402)),
                                markers: temp,
                              ),
                            );
                          }
                        },
                    ),
                    Container(
                        padding:EdgeInsets.all(20),
                        child: ToggleSwitch(
                          minWidth: 60.0,
                          minHeight: 40.0,
                          initialLabelIndex: idx,
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
                            setState(() {
                              idx = index!;
                              myFuture = getdata(index, selectedDropdown1);
                            });
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
  Future<void> _goToNewPosition() async {
    final NaverMapController controller = await _controller.future;
    controller.moveCamera(CameraUpdate.toCameraPosition(_AfterPosition!));
  }
  void _onMarkerTap(Marker? marker,Map<String,int> iconSize){
   int pos = temp.indexWhere((m) => m.markerId == marker!.markerId);
   setState(() {
     temp[pos].captionText = "선택됨";
   });
  }
}
