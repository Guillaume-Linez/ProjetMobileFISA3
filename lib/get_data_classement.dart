class MyData {
  String? title;
  String? subtitle;
  String? time;

  MyData({required this.title, required this.subtitle, required this.time});
  MyData.fromJson(Map<String,dynamic> json){
    title = json['title'];
    subtitle = json['subtitle'];
    time = json['time'];
  }
}






