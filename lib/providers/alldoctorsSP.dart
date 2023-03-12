import 'package:flutter/material.dart';
import 'package:medical_services/components/defaultToast.dart';
import 'package:medical_services/models/doctorModel.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/network/remote/api_helper.dart';
import 'package:medical_services/settings/colors.dart';

import '../settings/routes_manger.dart';

class GetallDoctorsSPProvider extends ChangeNotifier {
  List doctorsList = [];

  getAllDoctorsSP({required String nameSP, required context}) async {
    ApiHelper.postData(url: EndPoints.getallDoctorsSP, body: {'name': nameSP})
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
      print('error happen in get all doctors sp = $e');
    });
  }
}
