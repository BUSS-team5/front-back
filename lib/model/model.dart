class Ev {
  int? arrtime; // 남은 시간
  String? bussnum; // 버스 번호

  Ev({
    this.arrtime,
    this.bussnum,
  });

  factory Ev.fromJson(Map<String, dynamic>? json) {
    var temp;

    if(json?["arrtime"] is String){
      temp = int.tryParse(json?["arrtime"] ?? "");
    }
    return Ev(
      arrtime: temp,
      bussnum: json?["routeno"] as String,
    );
  }
}