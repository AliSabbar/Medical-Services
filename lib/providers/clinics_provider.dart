import 'package:flutter/material.dart';
import 'package:medical_services/models/clinicsNearMe_Model.dart';
import 'package:medical_services/models/clinicsTopRating_Model.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/network/remote/api_helper.dart';

import '../components/defaultToast.dart';

class ClinicsProvider extends ChangeNotifier {
  List listclinicsNearMe = [];
  List ListclinicTopRating = [];
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
      ListclinicTopRating =
          await value['data'].map((e) => ClinicsTopRating.fromJson(e)).toList();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      defaultToast(message: 'تحقق من اتصالك بالانترنت', color: Colors.red);
      print('error happen in clinics top rating= $e');
    });
  }
}
