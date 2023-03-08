// To parse this JSON data, do
//
//     final signInUserModel = signInUserModelFromJson(jsonString);

import 'dart:convert';

SignInUserModel signInUserModelFromJson(String str) => SignInUserModel.fromJson(json.decode(str));

String signInUserModelToJson(SignInUserModel data) => json.encode(data.toJson());

class SignInUserModel {
    SignInUserModel({
        required this.phoneNumber,
        required this.password,
    });

    String phoneNumber;
    String password;

    factory SignInUserModel.fromJson(Map<String, dynamic> json) => SignInUserModel(
        phoneNumber: json["phoneNumber"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "password": password,
    };
}
