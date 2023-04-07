import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/network/remote/api_helper.dart';

import '../models/capsule_model.dart';

class BookingProvider extends ChangeNotifier {
  late CapsuleModel capsuleModel;
  bool isLoading = false;
  List capsuleList = [];

  // ! GET CAPSULE
  getAppointment({
    required String drID,
    required String date,
  }) {
    isLoading = true;
    notifyListeners();
    ApiHelper.postData(
        url: "${EndPoints.getDocAppointment}?size=10",
        body: {"id": drID, "data": date}).then((value) {
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

  String convertTime({required String time}) {
    final inputFormat = DateFormat('HH:mm');
    final outputFormat = DateFormat('h:mm a');

    final dateTime = inputFormat.parse(time);
    return outputFormat.format(dateTime);
  }
}
