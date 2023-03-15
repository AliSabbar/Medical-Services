import 'package:flutter/material.dart';
import 'package:medical_services/components/defaultToast.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/network/remote/api_helper.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:provider/provider.dart';

import '../models/list_doctor_model.dart';
import '../settings/routes_manger.dart';

class DoctorProvider extends ChangeNotifier {
  List doctorsListSP = [];
  List favDoctors = [];

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
      doctorsListSP = await value['data'][0]['dr']
          .map((e) => ListDoctorModel.fromJson(e))
          .toList();
      if (doctorsListSP.isEmpty) {
        defaultToast(
            message: "لايوجد اطباء في هذا الاختصاص",
            color: AppColors.secondaryColor);
      } else {
        Navigator.pushNamed(context, Routes.doctorsScreen);
      }
      print(doctorsListSP);
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
      print("====ADD TO FAV=== $value");
      notifyListeners();
    }).catchError((e) {
      defaultToast(message: 'تحقق من الاتصال بالانترنت', color: Colors.red);
      print("ERROR IN ADD DOCTOR TO FAV = $e");
    });
    notifyListeners();
  }

  // ! REMOVE DOCTOR FROM FAVORITE

  removeDoctorFromFav(
      {required String doctorID, required String userID, String type = "dr"}) {
    ApiHelper.postData(
        url: EndPoints.removeDoctorFromFav,
        body: {"idDr": doctorID, "idUser": userID, "type": type}).then((value) {
      print("===REMOVE FROM FAV===$value");
      notifyListeners();
    }).catchError((e) {
      defaultToast(message: 'تحقق من الاتصال بالانترنت', color: Colors.red);
      print("ERROR IN ADD DOCTOR TO FAV = $e");
    });
    notifyListeners();
  }

//! GET FAV

  getFav(BuildContext ctx) {
    favDoctors = ctx
        .read<AuthProvider>()
        .userModel!
        .data
        .favoritedr
        .map((e) => ListDoctorModel.fromJson(e))
        .toList();

    print(favDoctors);
  }

  isExist({
    required doctorID,
    required userID,
    required context,
  }) {
    return favDoctors.any((item) => item.id == doctorID);
  }

  addAndRemoveFavDoc(
      {required bool isExist,
      required String doctorID,
      required String userID,
      required BuildContext context}) async {
    if (isExist) {
      removeDoctorFromFav(doctorID: doctorID, userID: userID);
      context.read<AuthProvider>().getUserDataById(id: userID);
      notifyListeners();
    } else if (!isExist) {
      addDoctorToFav(doctorID: doctorID, userID: userID);
      isExist = true;
      getFav(context);
      notifyListeners();
    }
  }
}
