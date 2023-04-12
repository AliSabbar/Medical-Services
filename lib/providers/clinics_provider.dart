import 'package:flutter/material.dart';
import 'package:medical_services/models/clinicsNearMe_Model.dart';
import 'package:medical_services/models/clinicsTopRating_Model.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/network/remote/api_helper.dart';

import '../components/defaultToast.dart';
import '../models/allClinics_model.dart';
import '../models/clinic_model.dart';
import '../models/fav_clinic_model.dart';

class ClinicsProvider extends ChangeNotifier {
  List listClinicsNearMe = [];
  List listClinicTopRating = [];
  List listAllClinics = [];
  List favClinics = [];
  var clinic;
  bool isLoading = false;
  //! Get the near by clinics
  getClinicsNearMe() async {
    isLoading = true;
    notifyListeners();
    ApiHelper.getData(url: EndPoints.getClinicsNearMe).then((value) async {
      listClinicsNearMe = await value['data']
          .map((e) => ClinicsNearMeModel.fromJson(e))
          .toList();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      defaultToast(message: 'تحقق من اتصالك بالانترنت', color: Colors.red);
      print('error happen in clinics near me = $e');
    });
  }
//! get top rating clinics

  getClinicsTopRating() async {
    isLoading = true;
    notifyListeners();
    ApiHelper.getData(url: EndPoints.getClinicTopRating).then((value) async {
      listClinicTopRating =
          await value['data'].map((e) => ClinicsTopRating.fromJson(e)).toList();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      defaultToast(message: 'تحقق من اتصالك بالانترنت', color: Colors.red);
      print('error happen in clinics top rating = $e');
    });
  }

  //! get all the clinics

  getAllClinics() async {
    isLoading = true;
    notifyListeners();
    ApiHelper.getData(url: EndPoints.getAllClinics).then((value) async {
      listAllClinics =
          await value['data'].map((e) => AllClinicsModel.fromJson(e)).toList();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      defaultToast(message: 'تحقق من اتصالك بالانترنت', color: Colors.red);
      print('error happen in all clinics = $e');
    });
  }

  //! get clinic by id

  getClinicByid({required String clinicId, required context}) async {
    isLoading = true;
    notifyListeners();
    ApiHelper.postData(url: EndPoints.getClinicById, body: {'id': clinicId})
        .then((value) async {
      clinic = await value['data'].map((e) => ClinicModel.fromJson(e));
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      defaultToast(message: 'تحقق من اتصالك بالانترنت', color: Colors.red);
      print('error happen in one clinic = $e');
    });
  }

  // ! ADD CLINIC TO FAVORITE

  addClinicToFav(
      {required String clinicID, required String userID, String type = "hf"}) {
    ApiHelper.postData(
        url: EndPoints.addToFav,
        body: {"idDr": clinicID, "idUser": userID, "type": type}).then((value) {
      print("====ADD TO FAV=== $value");
      getFav(userId: userID);
      notifyListeners();
    }).catchError((e) {
      defaultToast(message: 'تحقق من الاتصال بالانترنت', color: Colors.red);
      print("ERROR IN ADD CLINIC TO FAV = $e");
    });
    notifyListeners();
  }

  // ! REMOVE CLINIC FROM FAVORITE

  removeClinicFromFav(
      {required String clinicID, required String userID, String type = "hf"}) {
    ApiHelper.postData(
        url: EndPoints.removeFromFav,
        body: {"idDr": clinicID, "idUser": userID, "type": type}).then((value) {
      print("===REMOVE FROM FAV===$value");
      getFav(userId: userID);
      notifyListeners();
    }).catchError((e) {
      defaultToast(message: 'تحقق من الاتصال بالانترنت', color: Colors.red);
      print("ERROR IN REMOVE CLINIC FROM FAV = $e");
    });
    notifyListeners();
  }

//! GET FAV

  getFav({required String userId}) {
    isLoading = true;
    notifyListeners();
    ApiHelper.getData(url: EndPoints.getFav + userId).then((value) async {
      favClinics = await value['data']['favoritehf']
          .map((e) => FavClinicModel.fromJson(e))
          .toList();
      isLoading = false;
      notifyListeners();
      print(favClinics);
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
      defaultToast(message: 'لا يمكن الاتصال بالانترنت', color: Colors.red);
      print('ERROR IN GET FAV = $e');
    });
  }

  bool isExist = false;

//! CHECK IF CLINIC IN FAV

  checkClinicInFav({
    required clinicId,
  }) {
    isExist = favClinics.any((item) => item.id == clinicId);
    return isExist;
  }

  addORremoveClinicFromFav({
    required clinicID,
    required userID,
  }) async {
    isLoading = true;
    notifyListeners();
    if (isExist) {
      await removeClinicFromFav(clinicID: clinicID, userID: userID);
      print("object");
      isLoading = false;
      notifyListeners();
    } else if (!isExist) {
      await addClinicToFav(clinicID: clinicID, userID: userID);
      isLoading = false;
      notifyListeners();
      print("nooooooooooooooooooooooooooooo");
    }
    notifyListeners();
  }
}
