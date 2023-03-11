import 'package:flutter/material.dart';

import 'package:medical_services/components/defaultToast.dart';
import 'package:medical_services/models/specialty_model.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/network/remote/api_helper.dart';

class HomeProvider extends ChangeNotifier {
// ! SPECIALTY
  late SpecialtyModel specialtyModel;
  List specialtyList = [];
  bool isLoading = false;

  //! GET ALL SPECIALTY
  late int currentPage;
  late int totalPage;
  getAllSpecialty({
    required int page,
  }) async {
    isLoading = true;
    notifyListeners();
    await ApiHelper.getData(url: "${EndPoints.getAllSpecialty}&page=$page")
        .then((value) {
      specialtyModel = SpecialtyModel.fromJson(value);
      currentPage = int.parse(specialtyModel.code.substring(14, 15));
      totalPage = int.parse(specialtyModel.message.substring(12, 13));
      print("Current Page = $currentPage");
      print("Total Page = $totalPage");
      specialtyList += specialtyModel.data;
      isLoading = false;
      notifyListeners();
      print(specialtyList);
    }).catchError((e) {
      defaultToast(message: 'لايوجد اتصال في الانترنت', color: Colors.red);
      print("Error Specialty = $e");
    });
  }

  //! SEARCH SPECIALTY

  searchSpecialty({
    required String search,
  }) {
    specialtyList = specialtyList
        .where((element) => element.name.contains(search))
        .toList();
    notifyListeners();
  }
}
