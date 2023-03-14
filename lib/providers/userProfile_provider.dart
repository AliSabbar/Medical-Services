import 'package:flutter/material.dart';
import 'package:medical_services/components/defaultToast.dart';
import 'package:medical_services/network/remote/api_helper.dart';
import 'package:medical_services/providers/auth_provider.dart';

import '../models/user_model.dart';
import '../network/end_points.dart';

class UserProfileProvider extends ChangeNotifier {
  String initialGovernorate = "بغداد";

  List governorateList = [
    'بغداد',
    'البصرة',
    'الأنبار ',
    'ميسان ',
    'ذي قار',
    'صلاح الدين ',
    'المثنى',
    'كربلاء ',
    'بابل ',
    'نينوى ',
    'النجف',
    'القادسيه',
    'ديالى ',
    'أربيل ',
    'واسط',
    'دهوك',
    'كركوك ',
    'السليمانيه ',
  ];

  String initialGender = "ذكر";

  List genderList = ["ذكر", "انثى"];

//* Change Drop Button Down Value

  changeGovernorateValue({
    required value,
  }) {
    initialGovernorate = value;
    notifyListeners();
  }

  changeGenderValue({
    required value,
  }) {
    initialGender = value;
    notifyListeners();
  }

//! ACTIVE AND INACTIVE
  bool isActive = false;
  activeField() {
    isActive = true;
    notifyListeners();
  }

  inactiveField() {
    isActive = false;
    notifyListeners();
  }


  bool isLoading = false;


  //! UPDATE USER DATA
  updateUserData({
    required String id,
    required String name,
    required String avatar,
    required String dob,
    required String gender,
    required String city,
    required String town,
    context,
  }) async {
    isLoading = true;
    notifyListeners();
    await ApiHelper.updateData(url: EndPoints.updateUserProfile + id, body: {
      "name": name,
      "avatar": avatar,
      "dob": dob,
      "gender": gender,
      "city": city,
      "town": town,
    }).then((value) {
      isLoading = false;
      notifyListeners();
      print("=============================================================");
      print(value);

      print("=============================================================");
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
      defaultToast(message: "تحقق من الاتصال بالانترنت", color: Colors.red);
      print("ERROR IN UPDATE PROFILE DATA = $e");
    });
    notifyListeners();
  }
}
