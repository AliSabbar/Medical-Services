// To parse this JSON data, do
//
//     final clinicModel = clinicModelFromJson(jsonString);

import 'dart:convert';

ClinicModel clinicModelFromJson(String str) => ClinicModel.fromJson(json.decode(str));

String clinicModelToJson(ClinicModel data) => json.encode(data.toJson());

class ClinicModel {
    ClinicModel({
        required this.code,
        required this.data,
        required this.success,
        required this.message,
    });

    String code;
    Data data;
    bool success;
    String message;

    factory ClinicModel.fromJson(Map<String, dynamic> json) => ClinicModel(
        code: json["code"],
        data: Data.fromJson(json["data"]),
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "data": data.toJson(),
        "success": success,
        "message": message,
    };
}

class Data {
    Data({
        required this.id,
        required this.userId,
        required this.drNumbers,
        required this.openAt,
        required this.closeAt,
        this.rating,
        required this.specialtiesNumbers,
        required this.isAvailable,
        required this.description,
        required this.dr,
        required this.specialties,
        required this.user,
    });

    String id;
    String userId;
    int drNumbers;
    int openAt;
    int closeAt;
    dynamic rating;
    int specialtiesNumbers;
    bool isAvailable;
    String description;
    List<dynamic> dr;
    List<dynamic> specialties;
    User user;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["userId"],
        drNumbers: json["drNumbers"],
        openAt: json["openAt"],
        closeAt: json["closeAt"],
        rating: json["rating"],
        specialtiesNumbers: json["specialtiesNumbers"],
        isAvailable: json["isAvailable"],
        description: json["description"],
        dr: List<dynamic>.from(json["dr"].map((x) => x)),
        specialties: List<dynamic>.from(json["specialties"].map((x) => x)),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "drNumbers": drNumbers,
        "openAt": openAt,
        "closeAt": closeAt,
        "rating": rating,
        "specialtiesNumbers": specialtiesNumbers,
        "isAvailable": isAvailable,
        "description": description,
        "dr": List<dynamic>.from(dr.map((x) => x)),
        "specialties": List<dynamic>.from(specialties.map((x) => x)),
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
        required this.setting,
        required this.role,
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
    dynamic otpId;
    Setting setting;
    Role role;

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
        setting: Setting.fromJson(json["setting"]),
        role: Role.fromJson(json["role"]),
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
        "setting": setting.toJson(),
        "role": role.toJson(),
    };
}

class Role {
    Role({
        required this.id,
        required this.name,
        required this.isVerify,
        required this.isActive,
    });

    String id;
    String name;
    bool isVerify;
    bool isActive;

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        isVerify: json["isVerify"],
        isActive: json["isActive"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isVerify": isVerify,
        "isActive": isActive,
    };
}

class Setting {
    Setting({
        required this.id,
        required this.avatar,
        required this.language,
        required this.darkmode,
        required this.bio,
        required this.dob,
        required this.gender,
    });

    String id;
    String avatar;
    String language;
    bool darkmode;
    String bio;
    DateTime dob;
    String gender;

    factory Setting.fromJson(Map<String, dynamic> json) => Setting(
        id: json["id"],
        avatar: json["avatar"],
        language: json["language"],
        darkmode: json["darkmode"],
        bio: json["bio"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "avatar": avatar,
        "language": language,
        "darkmode": darkmode,
        "bio": bio,
        "dob": dob.toIso8601String(),
        "gender": gender,
    };
}
