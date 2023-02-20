import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool isVisible = true;

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

  //* change visibility of password

  changeEyeValue() {
    isVisible = !isVisible;
    notifyListeners();
  }

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
}
