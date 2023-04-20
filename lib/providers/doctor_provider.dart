import 'package:flutter/material.dart';
import 'package:medical_services/components/defaultToast.dart';
import 'package:medical_services/models/doctor_female_gender_model.dart';
import 'package:medical_services/models/doctor_low_cost_model.dart';
import 'package:medical_services/models/doctor_male_gender_model.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/network/remote/api_helper.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:provider/provider.dart';
import '../models/doctor_high_cost_model.dart';
import '../models/doctor_topRating_model.dart';
import '../models/list_doctor_model.dart';
import '../settings/routes_manger.dart';
import '../models/fav_doctor_model.dart';

class DoctorProvider extends ChangeNotifier {
  late ListDoctorModel listDoctorModelSP;
  late AllDrByRating allDocByRating;
  late AllDrByHighCost allDocByHighCost;
  late AllDrByLowCost allDocByLowCost;
  late AllMaleDr allMaleDr;
  late AllFemaleDr allFemaleDr;
  List doctorsListSP = [];
  List favDoctors = [];
  bool isLoading = false;

  AuthProvider? authProvider;

// ! SORTING AND FLITTER

  int? sort;
  int? filleter;
  changeSortValue(
      {required value, required String specialtyName, required context}) {
    sort = value;

    //* top rating

    if (sort == 1) {
      sortTopRating(specialtyName: specialtyName);
    }

    //* high pricing
    else if (sort == 2) {
      sortHighCost(specialtyName: specialtyName);
    }
    //* low pricing
    else if (sort == 3) {
      sortLowCost(specialtyName: specialtyName);
    }
    Navigator.pop(context);
    notifyListeners();
  }

  changeFilleterValue(
      {required value, required String specialtyName, required context}) {
    filleter = value;
    if (filleter == 1) {
    }
    //* male dr
    else if (filleter == 2) {
      filleterMaleDr(specialtyName: specialtyName);
    }
    // * female dr
    else if (filleter == 3) {
      filleterFemaleDr(specialtyName: specialtyName);
    }

    Navigator.pop(context);
    notifyListeners();
  }

// ! GET ALL DOCTOR SAME SPECIALTY

  getAllDoctorsSP({required String nameSP, required context}) async {
    isLoading = true;
    notifyListeners();
    ApiHelper.postData(url: EndPoints.getAllDoctorsSP, body: {'name': nameSP})
        .then((value) async {
      listDoctorModelSP = ListDoctorModel.fromJson(value);
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

  // ! SEARCH DOCTOR

  searchDoctor({
    required String search,
  }) {
    doctorsListSP = doctorsListSP
        .where((element) => element.user.name.contains(search))
        .toList();
    notifyListeners();
  }

// * SORT

  // ! SORTING TOP RATING

  sortTopRating({required String specialtyName}) async {
    ApiHelper.postData(
        url: "${EndPoints.sortDocByTopRating}?size=10&page=1",
        body: {
          "name": specialtyName,
        }).then((value) {
      allDocByRating = AllDrByRating.fromJson(value);
      doctorsListSP = allDocByRating.data;
      notifyListeners();
    }).catchError((e) {
      defaultToast(message: "تحقق من الاتصال بالانترنت", color: Colors.red);
      print("ERROR IN SORT TOP RATING = $e");
    });
  }

  // ! SORTING HIGH COST

  sortHighCost({required String specialtyName}) async {
    ApiHelper.postData(
        url: "${EndPoints.sortDocByCost}?size=10&page=1",
        body: {"name": specialtyName, "type": "high"}).then((value) {
      allDocByHighCost = AllDrByHighCost.fromJson(value);
      doctorsListSP = allDocByHighCost.data;
      notifyListeners();
    }).catchError((e) {
      defaultToast(message: "تحقق من الاتصال بالانترنت", color: Colors.red);

      print("ERROR IN SORTING HIGH COST = $e");
    });
  }

  // ! SORTING LOW COST

  sortLowCost({required String specialtyName}) async {
    ApiHelper.postData(
        url: "${EndPoints.sortDocByCost}?size=10&page=1",
        body: {"name": specialtyName, "type": "low"}).then((value) {
      allDocByLowCost = AllDrByLowCost.fromJson(value);
      doctorsListSP = allDocByLowCost.data;
      notifyListeners();
    }).catchError((e) {
      defaultToast(message: "تحقق من الاتصال بالانترنت", color: Colors.red);

      print("ERROR IN SORTING LOW COST = $e");
    });
  }

// * FILLETER

  // ! FILLETER BY GENDER

  filleterMaleDr({required String specialtyName}) async {
    ApiHelper.postData(
        url: "${EndPoints.filleterDocByGender}?size=10&page=1",
        body: {"name": specialtyName, "gender": "ذكر"}).then((value) {
      allMaleDr = AllMaleDr.fromJson(value);
      doctorsListSP = allMaleDr.data;
      notifyListeners();
    }).catchError((e) {
      defaultToast(message: "تحقق من الاتصال بالانترنت", color: Colors.red);
      print("ERROR IM FILLETER MALE DR  = $e");
    });
  }

  filleterFemaleDr({required String specialtyName}) async {
    ApiHelper.postData(
        url: "${EndPoints.filleterDocByGender}?size=10&page=1",
        body: {"name": specialtyName, "gender": "انثى"}).then((value) {
      allFemaleDr = AllFemaleDr.fromJson(value);
      doctorsListSP = allFemaleDr.data;
      notifyListeners();
    }).catchError((e) {
      defaultToast(message: "تحقق من الاتصال بالانترنت", color: Colors.red);
      print("ERROR IM FILLETER FEMALE DR  = $e");
    });
  }

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

  // ! DOCTOR OPEN OR CLOSE

// * inject another Auth Provider to get doctor data

  getDoctorData(context, doctorId) async {
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider!.getDoctorData(doctorId: doctorId);
    print(authProvider!.doctorModel!.data.id);
  }

  availableDoc({
    required String docId,
    required bool isAvailable,
    required context,
  }) async {
    isLoading = true;
    notifyListeners();
    await ApiHelper.postData(url: EndPoints.doctorOpenOrClose, body: {
      "id": docId,
      "available": isAvailable,
    }).then((value) async {
      await getDoctorData(context, docId);
      notifyListeners();
      isLoading = false;
      notifyListeners();
      print(value);
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
      defaultToast(message: 'لا يوجد اتصال بالانترنت', color: Colors.red);
      print("ERROR IN DOCTOR OPEN OR CLOSE = $e");
      notifyListeners();
    });
  }
}
