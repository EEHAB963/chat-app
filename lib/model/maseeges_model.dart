class MassegeModel {
  String? massege;
  String? name;
  var time;

  MassegeModel({this.massege, this.name, this.time});

// json to dart
  MassegeModel.fromJson(Map<String, dynamic> json) {
    massege = json['text'];
    name = json['name'];
    time = json['time'];
  }

  Map<String, dynamic> postMassege() {
    return {
      'text': massege,
      'name': name,
      'time': time,
    };
  }
}
