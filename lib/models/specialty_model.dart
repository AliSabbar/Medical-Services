// To parse this JSON data, do
//
//     final specialtyModel = specialtyModelFromJson(jsonString);

import 'dart:convert';

SpecialtyModel specialtyModelFromJson(String str) => SpecialtyModel.fromJson(json.decode(str));

String specialtyModelToJson(SpecialtyModel data) => json.encode(data.toJson());

class SpecialtyModel {
    SpecialtyModel({
        required this.code,
        required this.data,
        required this.success,
        required this.message,
    });

    String code;
    List<Datum> data;
    bool success;
    String message;

    factory SpecialtyModel.fromJson(Map<String, dynamic> json) => SpecialtyModel(
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
        required this.id,
        required this.name,
    });

    int id;
    String name;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
