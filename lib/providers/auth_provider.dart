import 'package:flutter/material.dart';
import 'package:medical_services/components/defaultToast.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/network/local/shared_helper.dart';
import 'package:medical_services/network/remote/api_helper.dart';
import 'package:medical_services/settings/routes_manger.dart';

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

  bool isButtonShowing = true;

// ! SIGN UP

  signUp({required Map<String, dynamic> body, required context}) {
    isButtonShowing = false;
    notifyListeners();
    ApiHelper.postData(url: EndPoints.signUp, body: body).then((value) {
      print(value);
      isButtonShowing = true;
      notifyListeners();
      if (value["success"] == true) {
        Navigator.pushNamed(context, Routes.otpScreen,
            arguments: "تأكيد حسابك");
      }
    }).catchError((e) {
      isButtonShowing = true;
      notifyListeners();
      print("Error SIGN UP  = $e");
    });
  }

//! SIGN IN

  signIn({
    required context,
    required Map<String, dynamic> body,
  }) {
    isButtonShowing = false;
    notifyListeners();
    ApiHelper.postData(url: EndPoints.signIn, body: body).then((value) async {
      if (value['success'] == false && value['code'] == 404) {
        defaultToast(
            message: "لم يتم تسجيل رقم الهاتف في خدماتنا", color: Colors.red);
      } else if (value['success'] == false && value['code'] == 401) {
        defaultToast(message: "كلمة المرور خاطئة", color: Colors.red);
      } else if (value['success'] == true) {
        //* here we do tricky thing i think XD

        EndPoints.token = await value['data']['accessToken'];

        //* SAVE TOKEN TO LOCALE STORAGE

        await SharedHelper.saveData(key: 'token', value: EndPoints.token);

        defaultToast(message: "اهلا بك مرة اخرى", color: Colors.green);

        Navigator.pushNamedAndRemoveUntil(
            context, Routes.homeLayoutRoute, (route) => false);
      }
      isButtonShowing = true;
      notifyListeners();
      print(value);
    }).catchError((e) {
      isButtonShowing = true;
      notifyListeners();
      print("Error In SIGN IN = $e");
    });
  }
}
