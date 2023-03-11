// To parse this JSON data, do
//
//     final SignUpUserModel = SignUpUserModelFromJson(jsonString);

import 'dart:convert';

SignUpUserModel SignUpUserModelFromJson(String str) =>
    SignUpUserModel.fromJson(json.decode(str));

String SignUpUserModelToJson(SignUpUserModel data) =>
    json.encode(data.toJson());

class SignUpUserModel {
  SignUpUserModel({
    required this.phoneNumber,
    required this.password,
    required this.name,
    required this.roleName,
    this.avatar,
    this.bio,
    required this.dob,
    required this.gender,
    required this.city,
    required this.town,
  });

  String phoneNumber;
  String password;
  String name;
  String roleName;
  String? avatar;
  String? bio;
  DateTime dob;
  String gender;
  String city;
  String town;

  factory SignUpUserModel.fromJson(Map<String, dynamic> json) =>
      SignUpUserModel(
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        name: json["name"],
        roleName: json["roleName"],
        avatar: json["avatar"],
        bio: json["bio"],
        dob: json["dob"],
        gender: json["gender"],
        city: json["city"],
        town: json["town"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "password": password,
        "name": name,
        "roleName": roleName,
        "avatar": avatar,
        "bio": bio,
        "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        // "dob": dob,
        "gender": gender,
        "city": city,
        "town": town,
      };
}
