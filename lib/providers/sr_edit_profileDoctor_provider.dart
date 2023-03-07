import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SrEditDoctorProfileProvider extends ChangeNotifier {
  int currentStep = 0;

  String initialValue = 'ذكر';

  String initialGovernorate = "بغداد";

  // ! should get list from api

  String initialSpecialty = "ali";

  String secondSpecialty = "";

  List secondSpecialtyList = [];

  List specialtyList = ["ali", "ahmed"];

  // ! should get list from api

  List genderList = ["ذكر", "انثى"];

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

  // * change Drop Down Button value

  changeDropValue({
    required value,
    required String changeType,
  }) {
    if (changeType == "gender") {
      initialValue = value;
      notifyListeners();
    } else if (changeType == "governorate") {
      initialGovernorate = value;
      notifyListeners();
    } else if (changeType == "specialty") {
      initialSpecialty = value;
      notifyListeners();
    } else if (changeType == "secondSpecialty") {
      secondSpecialty = value;
      notifyListeners();
    }
  }

  // * onStepTapped Function

  onStepTapped({required newStep}) {
    currentStep = newStep;
    notifyListeners();
  }

  // * onStepContinue Function

  onStepContinue() {
    if (currentStep != 2) {
      currentStep += 1;
      notifyListeners();
    }
  }

  // * onStepCancel Function

  onStepCancel() {
    currentStep -= 1;
    notifyListeners();
  }
}
