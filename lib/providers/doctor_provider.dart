import 'package:flutter/material.dart';
import 'package:medical_services/components/defaultToast.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/network/remote/api_helper.dart';
import 'package:medical_services/settings/colors.dart';
import '../models/doctor_topRating_model.dart';
import '../models/list_doctor_model.dart';
import '../settings/routes_manger.dart';
import '../models/fav_doctor_model.dart';

class DoctorProvider extends ChangeNotifier {
  late ListDoctorModel listDoctorModelSP;
  late AllDrByRating allDocByRating;
  List doctorsListSP = [];
  List favDoctors = [];
  bool isLoading = false;

// ! SORTING AND FLITTER

  int? sort;
  int? filleter;
  changeSortValue({
    required value,
  }) {
    sort = value;

    //* top rating

    if (sort == 1) {
      sortTopRating();
    }

    //* high pricing
    else if (sort == 2) {
      // sortHighPricing();
    }
    //* low pricing
    else if (sort == 3) {
      // sortLowPricing();
    }
    notifyListeners();
  }

  changeFilleterValue({required value}) {
    filleter = value;
    if (filleter == 1) {
      print(filleter);
    } else if (filleter == 2) {
      print(filleter);
    } else if (filleter == 3) {
      print(filleter);
    }
    notifyListeners();
  }

// ! GET ALL DOCTOR SAME SPECIALTY

  getAllDoctorsSP({required String nameSP, required context}) async {
    isLoading = true;
    notifyListeners();
    ApiHelper.postData(url: EndPoints.getAllDoctorsSP, body: {'name': nameSP})
        .then((value) async {
      listDoctorModelSP = ListDoctorModel.fromJson(value);
      // doctorsListSP = await value['data'][0]['dr']
      //     .map((e) => ListDoctorModel.fromJson(e))
      //     .toList();
      doctorsListSP = listDoctorModelSP.data[0].dr!;
      if (doctorsListSP.isEmpty) {
        defaultToast(
            message: "لايوجد اطباء في هذا الاختصاص",
            color: AppColors.secondaryColor);
      }
      isLoading = false;
      notifyListeners();
      print(doctorsListSP);
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
      defaultToast(message: 'تحقق من اتصالك بالانترنت', color: Colors.red);
      print('error happen in get all doctors sp = $e');
    });
  }

// * SORT

  // ! SORTING TOP RATING

  sortTopRating() async {
    ApiHelper.getData(url: "${EndPoints.getDocTopRating}?size=10&page=1")
        .then((value) {
      allDocByRating = AllDrByRating.fromJson(value);
      doctorsListSP = allDocByRating.data;
      print(allDocByRating.data);
      notifyListeners();
    });
  }

  // // ! SORTING HIGH PRICING

  // sortHighPricing() {
  //   doctorsListSP.sort((a, b) => b.cost.compareTo(a.cost));
  //   print("HIGH PRICING = ${doctorsListSP.map((e) => e.cost)}");
  // }
  // // ! SORTING LOW PRICING

  // sortLowPricing() {
  //   doctorsListSP.sort((a, b) => a.cost.compareTo(b.cost));
  //   print("Low PRICING = ${doctorsListSP.map((e) => e.cost)}");
  // }

// * FILLETER

  // ! ADD DOCTOR TO FAVORITE

  addDoctorToFav(
      {required String doctorID, required String userID, String type = "dr"}) {
    ApiHelper.postData(
        url: EndPoints.addToFav,
        body: {"idDr": doctorID, "idUser": userID, "type": type}).then((value) {
      print("====ADD TO FAV=== $value");
      getFav(userId: userID);
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
        url: EndPoints.removeFromFav,
        body: {"idDr": doctorID, "idUser": userID, "type": type}).then((value) {
      print("===REMOVE FROM FAV===$value");
      getFav(userId: userID);
      notifyListeners();
    }).catchError((e) {
      defaultToast(message: 'تحقق من الاتصال بالانترنت', color: Colors.red);
      print("ERROR IN REMOVE DOCTOR FROM FAV = $e");
    });
    notifyListeners();
  }

//! GET FAV

  getFav({required String userId}) {
    isLoading = true;
    notifyListeners();
    ApiHelper.getData(url: EndPoints.getFav + userId).then((value) async {
      favDoctors = await value['data']['favoritedr']
          .map((e) => FavDoctorModel.fromJson(e))
          .toList();
      isLoading = false;
      notifyListeners();
      print(favDoctors);
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
      defaultToast(message: 'لا يمكن الاتصال بالانترنت', color: Colors.red);
      print('ERROR IN GET FAV = $e');
    });
  }

  bool isExist = false;

//! CHECK IF DOC IN FAV

  checkDocInFav({
    required doctorId,
  }) {
    isExist = favDoctors.any((item) => item.id == doctorId);
    return isExist;
  }

  addORremoveDocFromFav({
    required doctorID,
    required userID,
  }) async {
    isLoading = true;
    notifyListeners();
    if (isExist) {
      await removeDoctorFromFav(doctorID: doctorID, userID: userID);
      print("object");
      isLoading = false;
      notifyListeners();
    } else if (!isExist) {
      await addDoctorToFav(doctorID: doctorID, userID: userID);
      isLoading = false;
      notifyListeners();
      print("nooooooooooooooooooooooooooooo");
    }
    notifyListeners();
  }
}
