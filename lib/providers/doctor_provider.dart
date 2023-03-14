import 'package:flutter/material.dart';
import 'package:medical_services/components/defaultToast.dart';
import 'package:medical_services/models/doctorModel.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/network/remote/api_helper.dart';
import 'package:medical_services/settings/colors.dart';

import '../settings/routes_manger.dart';

class DoctorProvider extends ChangeNotifier {
  List doctorsList = [];

// ! SORTING AND FLITTER

  int? sort;
  int? filleter;
  changeSortValue({
    required value,
  }) {
    sort = value;
    notifyListeners();
  }

  changeFilleterValue({required value}) {
    filleter = value;
    notifyListeners();
  }

// ! GET ALL DOCTOR SAME SPECIALTY

  getAllDoctorsSP({required String nameSP, required context}) async {
    ApiHelper.postData(url: EndPoints.getAllDoctorsSP, body: {'name': nameSP})
        .then((value) async {
      doctorsList = await value['data'][0]['dr']
          .map((e) => DoctorModel.fromJson(e))
          .toList();
      if (doctorsList.isEmpty) {
        defaultToast(
            message: "لايوجد اطباء في هذا الاختصاص",
            color: AppColors.secondaryColor);
      } else {
        Navigator.pushNamed(context, Routes.doctorsScreen);
      }
      print(doctorsList);
    }).catchError((e) {
      defaultToast(message: 'تحقق من اتصالك بالانترنت', color: Colors.red);
      print('error happen in get all doctors sp = $e');
    });
  }

  // ! ADD DOCTOR TO FAVORITE

  addDoctorToFav(
      {required String doctorID, required String userID, String type = "dr"}) {
    ApiHelper.postData(
        url: EndPoints.addDoctorToFav,
        body: {"idDr": doctorID, "idUser": userID, "type": type}).then((value) {
      print(value);
    }).catchError((e) {
      defaultToast(message: 'تحقق من الاتصال بالانترنت', color: Colors.red);
      print("ERROR IN ADD DOCTOR TO FAV = $e");
    });
  }

  // ! REMOVE DOCTOR FROM FAVORITE
}
