// To parse this JSON data, do
//
//     final doctorModel = doctorModelFromJson(jsonString);

import 'dart:convert';

DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));

String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());

class DoctorModel {
    DoctorModel({
        required this.code,
        required this.data,
        required this.success,
        required this.message,
    });

    String code;
    Data data;
    bool success;
    String message;

    factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
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
        required this.cost,
        required this.openAt,
        required this.closeAt,
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
    int xp;
    String description;
    String magerSpecialties;
    bool isAvailable;
    dynamic hfId;
    User user;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["userId"],
        cost: json["cost"],
        openAt: json["openAt"],
        closeAt: json["closeAt"],
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
        required this.address,
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
    Address address;
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
        address: Address.fromJson(json["address"]),
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
        "address": address.toJson(),
        "setting": setting.toJson(),
        "role": role.toJson(),
    };
}

class Address {
    Address({
        required this.id,
        required this.city,
        required this.town,
    });

    String id;
    String city;
    String town;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        city: json["city"],
        town: json["town"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "town": town,
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
