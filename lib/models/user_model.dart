// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.code,
        required this.data,
        required this.success,
        required this.message,
    });

    String code;
    Data data;
    bool success;
    String message;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
        required this.phoneNumber,
        required this.name,
        required this.password,
        required this.roleId,
        required this.addressId,
        required this.settingId,
        required this.createdAt,
        required this.updatedAt,
        required this.otpId,
        required this.setting,
        required this.role,
        required this.address,
        required this.favoritedr,
        required this.favoritehf,
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
    Setting setting;
    Role role;
    Address address;
    List<dynamic> favoritedr;
    List<dynamic> favoritehf;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        address: Address.fromJson(json["address"]),
        favoritedr: List<dynamic>.from(json["favoritedr"].map((x) => x)),
        favoritehf: List<dynamic>.from(json["favoritehf"].map((x) => x)),
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
        "address": address.toJson(),
        "favoritedr": List<dynamic>.from(favoritedr.map((x) => x)),
        "favoritehf": List<dynamic>.from(favoritehf.map((x) => x)),
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
        this.avatar,
        required this.language,
        required this.darkmode,
        this.bio,
        required this.dob,
        required this.gender,
    });

    String id;
    dynamic avatar;
    String language;
    bool darkmode;
    dynamic bio;
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
