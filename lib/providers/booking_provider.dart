import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_services/models/inside_capsule_model.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/network/remote/api_helper.dart';

import '../models/capsule_model.dart';

class BookingProvider extends ChangeNotifier {
  late CapsuleModel capsuleModel;
  late InsideCapsule insideCapsule;
  bool isLoading = false;
  bool isLoadingInCap = false;
  
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



// ! CONVERT FROM 24 H TO 12 H
  String convertTime({required String time}) {
    final inputFormat = DateFormat('HH:mm');
    final outputFormat = DateFormat('h:mm a');

    final dateTime = inputFormat.parse(time);
    return outputFormat.format(dateTime);
  }
}
