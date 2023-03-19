import 'package:flutter/material.dart';
import 'package:medical_services/models/clinicsNearMe_Model.dart';
import 'package:medical_services/models/clinicsTopRating_Model.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/network/remote/api_helper.dart';

import '../components/defaultToast.dart';
import '../models/allClinics_model.dart';
import '../models/clinic_model.dart';

class ClinicsProvider extends ChangeNotifier {
  List listclinicsNearMe = [];
  List listclinicTopRating = [];
  List listAllClinics = [];
  var clinic;
  bool isLoading = false;
  //! Get the near by clinics
  getClinicsNearMe() async {
    isLoading = true;
    notifyListeners();
    ApiHelper.getData(url: EndPoints.getClinicsNearMe).then((value) async {
      listclinicsNearMe = await value['data']
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
      listclinicTopRating =
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
}
