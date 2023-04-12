// To parse this JSON data, do
//
//     final clinicsTopRating = clinicsTopRatingFromJson(jsonString);

import 'dart:convert';

List<ClinicsTopRating> clinicsTopRatingFromJson(String str) => List<ClinicsTopRating>.from(json.decode(str).map((x) => ClinicsTopRating.fromJson(x)));

String clinicsTopRatingToJson(List<ClinicsTopRating> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClinicsTopRating {
    ClinicsTopRating({
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
    double? rating;
    int specialtiesNumbers;
    bool isAvailable;
    String description;
    List<Dr> dr;
    List<dynamic> specialties;
    User user;

    factory ClinicsTopRating.fromJson(Map<String, dynamic> json) => ClinicsTopRating(
        id: json["id"],
        userId: json["userId"],
        drNumbers: json["drNumbers"],
        openAt: json["openAt"],
        closeAt: json["closeAt"],
        rating: json["rating"]?.toDouble(),
        specialtiesNumbers: json["specialtiesNumbers"],
        isAvailable: json["isAvailable"],
        description: json["description"],
        dr: List<Dr>.from(json["dr"].map((x) => Dr.fromJson(x))),
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
        "dr": List<dynamic>.from(dr.map((x) => x.toJson())),
        "specialties": List<dynamic>.from(specialties.map((x) => x)),
        "user": user.toJson(),
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
        required this.hfId,
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
    String hfId;

    factory Dr.fromJson(Map<String, dynamic> json) => Dr(
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
