import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_services/components/defaultToast.dart';
import 'package:medical_services/models/inside_capsule_model.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/network/remote/api_helper.dart';

import '../models/capsule_model.dart';
import '../settings/routes_manger.dart';

class BookingProvider extends ChangeNotifier {
  late CapsuleModel capsuleModel;
  late InsideCapsule insideCapsule;
  bool isLoading = false;
  bool isLoadingInCap = false;
  bool isLoadingConf = false;

  List capsuleList = [];
  List timeList = [];

  // ! GET CAPSULE
  getAppointment({
    required String drID,
    required String date,
  }) {
    isLoading = true;
    notifyListeners();
    ApiHelper.postData(
        url: "${EndPoints.getDocAppointment}?size=10",
        body: {"id": drID, "date": date}).then((value) {
      capsuleModel = CapsuleModel.fromJson(value);
      capsuleList = capsuleModel.data;
      print(value);
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
      print("Error in GET APPOINTMENT = $e");
    });
  }

//!  GET INSIDE CAPSULE
  getInsideAllCapsule({
    required String drID,
    required String date,
  }) {
    isLoadingInCap = true;
    notifyListeners();
    ApiHelper.postData(
        url: "${EndPoints.getInsideCapsule}?size=10",
        body: {"id": drID, "date": date}).then((value) {
      insideCapsule = InsideCapsule.fromJson(value);
      timeList = insideCapsule.data[0].time;
      print(timeList);
      isLoadingInCap = false;
      notifyListeners();
    }).catchError((e) {
      isLoadingInCap = false;
      notifyListeners();
      print("Error in GET ALL INSIDE CAPSULE = $e");
    });
  }

// ! CONFIRM APPOINTMENT

  confirmAppointment(
      {required String phoneNumber,
      required String name,
      required String time,
      required String date,
      required String drId,
      required String userId,
      required context,
      required drModel}) {
    final qrCode = generateQrCode();
    isLoadingConf = true;
    notifyListeners();
    ApiHelper.postData(url: EndPoints.confirmAppointment, body: {
      "phoneNumber": "+964$phoneNumber",
      "name": name,
      "qrCode": qrCode,
      "time": time,
      "date": date,
      "drId": drId,
      "userId": userId,
    }).then((value) {
      isLoadingConf = false;
      Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.qrCoderScreen,
          arguments: {"drModel": drModel, "qrCode": qrCode},
          (route) => false);
      notifyListeners();
      print(value);
    }).catchError((e) {
      isLoadingConf = false;
      notifyListeners();
      defaultToast(message: 'تحقق من الاتصال بالاننترنت', color: Colors.red);
      print("ERROR IN CONFIRM APPOINTMENT = $e");
    });
  }

// ! GENERATE QR CODE

  String generateQrCode({
    bool letter = true,
    bool isNumber = true,
    bool isSpecial = true,
  }) {
    const length = 16;
    const letterLowerCase = "abcdefghijklmnopqrstuvwxyz";
    const letterUpperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const number = '0123456789';
    const special = '@#%^*>\$@?/[]=+';
    String chars = "";
    if (letter) chars += '$letterLowerCase$letterUpperCase';
    if (isNumber) chars += number;
    if (isSpecial) chars += special;

    return List.generate(length, (index) {
      final indexRandom = Random.secure().nextInt(chars.length);
      return chars[indexRandom];
    }).join('');
  }

// ! CONVERT FROM 24 H TO 12 H
  String convertTime({required String time}) {
    final inputFormat = DateFormat('HH:mm');
    final outputFormat = DateFormat('h:mm a');

    final dateTime = inputFormat.parse(time);
    return outputFormat.format(dateTime);
  }
}
