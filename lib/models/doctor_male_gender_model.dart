// To parse this JSON data, do
//
//     final allMaleDrAllMaleDr = allMaleDrAllMaleDrFromJson(jsonString);

import 'dart:convert';

AllMaleDr allMaleDrAllMaleDrFromJson(String str) =>
    AllMaleDr.fromJson(json.decode(str));

String allMaleDrAllMaleDrToJson(AllMaleDr data) => json.encode(data.toJson());

class AllMaleDr {
  AllMaleDr({
    required this.code,
    required this.data,
    required this.success,
    required this.message,
  });

  String code;
  List<Datum> data;
  bool success;
  String message;

  factory AllMaleDr.fromJson(Map<String, dynamic> json) => AllMaleDr(
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
    required this.specialties,
  });

  String id;
  String userId;
  int cost;
  int openAt;
  int closeAt;
  double rating;
  int xp;
  String description;
  String magerSpecialties;
  bool isAvailable;
  dynamic hfId;
  User user;
  List<Specialty> specialties;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["userId"],
        cost: json["cost"],
        openAt: json["openAt"],
        closeAt: json["closeAt"],
        rating: json["rating"]?.toDouble(),
        xp: json["xp"],
        description: json["description"],
        magerSpecialties: json["magerSpecialties"],
        isAvailable: json["isAvailable"],
        hfId: json["hfId"],
        user: User.fromJson(json["user"]),
        specialties: List<Specialty>.from(
            json["specialties"].map((x) => Specialty.fromJson(x))),
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
        "specialties": List<dynamic>.from(specialties.map((x) => x.toJson())),
      };
}

class Specialty {
  Specialty({
    required this.id,
    required this.name,
    required this.photo,
  });

  int id;
  String name;
  String photo;

  factory Specialty.fromJson(Map<String, dynamic> json) => Specialty(
        id: json["id"],
        name: json["name"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photo": photo,
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
    required this.address,
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
  Address address;

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
        address: Address.fromJson(json["address"]),
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
