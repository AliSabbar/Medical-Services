// To parse this JSON data, do
//
//     final myBookingModel = myBookingModelFromJson(jsonString);

import 'dart:convert';

MyBookingModel myBookingModelFromJson(String str) =>
    MyBookingModel.fromJson(json.decode(str));

String myBookingModelToJson(MyBookingModel data) => json.encode(data.toJson());

class MyBookingModel {
  MyBookingModel({
    required this.code,
    required this.data,
    required this.success,
    required this.message,
  });

  String code;
  List<Datum> data;
  bool success;
  String message;

  factory MyBookingModel.fromJson(Map<String, dynamic> json) => MyBookingModel(
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
    required this.userId,
    required this.drId,
    required this.phoneNumber,
    required this.name,
    required this.time,
    required this.qrCode,
    required this.user,
    required this.dr,
  });

  String id;
  String userId;
  String drId;
  String phoneNumber;
  String name;
  String time;
  String qrCode;
  User user;
  Dr dr;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["userId"],
        drId: json["drId"],
        phoneNumber: json["phoneNumber"],
        name: json["name"],
        time: json["time"],
        qrCode: json["qrCode"],
        user: User.fromJson(json["user"]),
        dr: Dr.fromJson(json["dr"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "drId": drId,
        "phoneNumber": phoneNumber,
        "name": name,
        "time": time,
        "qrCode": qrCode,
        "user": user.toJson(),
        "dr": dr.toJson(),
      };
}

class Dr {
  Dr({
    required this.id,
    required this.userId,
    required this.cost,
    required this.openAt,
    required this.closeAt,
    required this.rating,
    required this.xp,
    required this.description,
    required this.magerSpecialties,
    required this.isAvailable,
    this.hfId,
    required this.user,
  });

  String id;
  String userId;
  int cost;
  int openAt;
  int closeAt;
  int rating;
  int xp;
  String description;
  String magerSpecialties;
  bool isAvailable;
  dynamic hfId;
  User user;

  factory Dr.fromJson(Map<String, dynamic> json) => Dr(
        id: json["id"],
        userId: json["userId"],
        cost: json["cost"],
        openAt: json["openAt"],
        closeAt: json["closeAt"],
        rating: json["rating"],
        xp: json["xp"],
        description: json["description"],
        magerSpecialties: json["magerSpecialties"],
        isAvailable: json["isAvailable"],
        hfId: json["hfId"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "cost": cost,
        "openAt": openAt,
        "closeAt": closeAt,
        "rating": rating,
        "xp": xp,
        "description": description,
        "magerSpecialties": magerSpecialties,
        "isAvailable": isAvailable,
        "hfId": hfId,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.phoneNumber,
    required this.name,
    required this.password,
    required this.roleId,
    required this.addressId,
    required this.settingId,
    required this.createdAt,
    required this.updatedAt,
    this.otpId,
  });

  String id;
  String phoneNumber;
  String name;
  String password;
  String roleId;
  String addressId;
  String settingId;
  DateTime createdAt;
  DateTime updatedAt;
  int? otpId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        phoneNumber: json["phoneNumber"],
        name: json["name"],
        password: json["password"],
        roleId: json["roleId"],
        addressId: json["addressId"],
        settingId: json["settingId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        otpId: json["otpId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phoneNumber": phoneNumber,
        "name": name,
        "password": password,
        "roleId": roleId,
        "addressId": addressId,
        "settingId": settingId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "otpId": otpId,
      };
}
