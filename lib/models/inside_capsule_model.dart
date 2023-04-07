// To parse this JSON data, do
//
//     final insideCapsule = insideCapsuleFromJson(jsonString);

import 'dart:convert';

InsideCapsule insideCapsuleFromJson(String str) =>
    InsideCapsule.fromJson(json.decode(str));

String insideCapsuleToJson(InsideCapsule data) => json.encode(data.toJson());

class InsideCapsule {
  InsideCapsule({
    required this.code,
    required this.data,
    required this.success,
    required this.message,
  });

  String code;
  List<Datum> data;
  bool success;
  String message;

  factory InsideCapsule.fromJson(Map<String, dynamic> json) => InsideCapsule(
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}

class Datum {
  Datum({
    required this.date,
    required this.time,
  });

  DateTime date;
  List<Time> time;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        date: DateTime.parse(json["date"]),
        time: List<Time>.from(json["time"].map((x) => Time.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "time": List<dynamic>.from(time.map((x) => x.toJson())),
      };
}

class Time {
  Time({
    required this.id,
    required this.av,
    required this.time,
  });

  String id;
  bool av;
  String time;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        id: json["id"],
        av: json["av"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "av": av,
        "time": time,
      };
}
