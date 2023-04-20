// To parse this JSON data, do
//
//     final patientsAppointmentsModel = patientsAppointmentsModelFromJson(jsonString);

import 'dart:convert';

PatientsAppointmentsModel patientsAppointmentsModelFromJson(String str) => PatientsAppointmentsModel.fromJson(json.decode(str));

String patientsAppointmentsModelToJson(PatientsAppointmentsModel data) => json.encode(data.toJson());

class PatientsAppointmentsModel {
    PatientsAppointmentsModel({
        required this.code,
        required this.data,
        required this.success,
        required this.message,
    });

    String code;
    List<Datum> data;
    bool success;
    String message;

    factory PatientsAppointmentsModel.fromJson(Map<String, dynamic> json) => PatientsAppointmentsModel(
        code: json["code"].toString(),
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
        required this.date,
        required this.qrCode,
        required this.user,
    });

    String id;
    String userId;
    String drId;
    String phoneNumber;
    String name;
    String time;
    DateTime date;
    String qrCode;
    User user;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["userId"],
        drId: json["drId"],
        phoneNumber: json["phoneNumber"],
        name: json["name"],
        time: json["time"],
        date: DateTime.parse(json["date"]),
        qrCode: json["qrCode"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "drId": drId,
        "phoneNumber": phoneNumber,
        "name": name,
        "time": time,
        "date": date.toIso8601String(),
        "qrCode": qrCode,
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
        required this.otpId,
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
    int otpId;

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
