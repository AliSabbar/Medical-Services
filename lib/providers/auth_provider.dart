import 'package:flutter/material.dart';
import 'package:medical_services/components/defaultToast.dart';
import 'package:medical_services/models/doctor_model.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/network/local/shared_helper.dart';
import 'package:medical_services/network/remote/api_helper.dart';
import 'package:medical_services/settings/routes_manger.dart';

import '../models/user_model.dart';

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

  bool isLoading = false;

  UserModel? userModel;

  DoctorModel? doctorModel;

// ! SIGN UP

  signUp({required Map<String, dynamic> body, required context}) {
    isButtonShowing = false;
    notifyListeners();
    ApiHelper.postData(url: EndPoints.signUp, body: body).then((value) async {
      print(value);
      isButtonShowing = true;
      notifyListeners();
      if (value["success"] == true) {
        await otp(
          phoneNumber: value['data']['phoneNumber'],
        );
        Navigator.pushNamed(
          context,
          Routes.otpScreen,
          arguments: {
            "title": "تأكيد الحساب",
            "userData": {
              "phoneNumber": value['data']['phoneNumber'],
              "type": "verify"
            },
          },
        );
      }
    }).catchError((e) {
      isButtonShowing = true;
      notifyListeners();
      print("Error SIGN UP  = $e");
    });
  }

// ! OTP
  Future otp({
    required String phoneNumber,
  }) {
    var data = ApiHelper.postData(url: EndPoints.otp, body: {
      "phoneNumber": phoneNumber,
    }).then((value) {
      if (value['success'] == true) {
        defaultToast(message: 'تم ارسال رمز التحقق بنجاح', color: Colors.green);
      } else if (value['success'] == false && value['code'] == 404) {
        defaultToast(message: 'لايوجد مستخدم بهذا الرقم', color: Colors.red);
      }
      print(value);
      return value;
    }).catchError((e) {
      defaultToast(message: 'تحقق من اتصالك بالانترنت', color: Colors.red);
      print("Error in OTP = $e");
    });

    return (data);
  }

  verifyOtp(
      {required otpCode,
      required String phoneNumber,
      required String type,
      required context}) {
    ApiHelper.postData(
            url: EndPoints.verifyOtp,
            body: {'OTP': otpCode, 'phoneNumber': phoneNumber, 'type': type})
        .then((value) {
      print(value);
      if (value['success'] == false && value['code'] == 401) {
        defaultToast(message: 'الكود غير صحيح', color: Colors.red);
      } else if (value['success'] == false && value['code'] == 400) {
        defaultToast(message: 'تم انتهاء صلاحية هذا الكود', color: Colors.red);
      } else if (value['success'] == true) {
        if (value['data'] == "true") {
          print("FORGET PASSWORD FUCK ME");
          Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.confirmForgetPasswordScreen,
              arguments: {
                "phoneNumber": phoneNumber,
              },
              (route) => false);
        } else {
          defaultToast(message: 'تم تفعيل الحساب', color: Colors.green);
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.signInScreen, (route) => false);
        }
      }
    }).catchError((e) {
      defaultToast(message: 'تحقق من اتصالك بالانترنت', color: Colors.red);
      print("Error in verifyOtp = $e");
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

        //* SAVE USER ID LOCAL
        await SharedHelper.saveData(key: 'userId', value: value['data']['id']);

        print("================ USER ROLE = ${value['data']['roleName']}");

        if (value['data']['roleName'] == "dr") {
          print("================= DOCTOR MODEL =================");
          await getDoctorData(doctorId: value['data']['drIdOrHfId']);
          print("================= DOCTOR MODEL =================");
        }

        await getUserDataById(id: value['data']['id']);

        defaultToast(message: "اهلا بك مرة اخرى", color: Colors.green);

        Navigator.pushNamedAndRemoveUntil(
            context, Routes.homeLayoutRoute, (route) => false);
        notifyListeners();
      }
      isButtonShowing = true;
      notifyListeners();
      // print(value);
    }).catchError((e) {
      isButtonShowing = true;
      notifyListeners();
      defaultToast(message: "تحقق من الاتصال بالانترنت", color: Colors.red);
      print("Error In SIGN IN = $e");
    });
  }

  //! GET USER DATA [SIGN IN]

  getUserDataById({required String id}) async {
    // userModel = null;
    isLoading = true;
    notifyListeners();
   await ApiHelper.getData(url: EndPoints.getUserById + id).then((value) async {
      userModel = UserModel.fromJson(value);
      // print("SHARED ID = ${SharedHelper.getData(key: 'userId')}");
      // print(userModel!.data.name);
      // print(value);
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
      print("Error in GET USER BY ID [AUTH PROVIDER] = $e");
    });
    notifyListeners();
  }

  // ! GET DOCTOR DATA [SIGN IN]

  getDoctorData({required String doctorId})async {
   await ApiHelper.getData(url: EndPoints.getDoctorById + doctorId).then((value) {
      doctorModel = DoctorModel.fromJson(value);
    }).catchError((e) {
      print("ERROR IN GET DOCTOR DATA = $e");
    });
  }

// ! FORGOT PASSWORD

  forgotPassword(
      {required TextEditingController forgotPasswordController,
      required context}) {
    if (forgotPasswordController.text.isEmpty ||
        forgotPasswordController.text.length != 12) {
      defaultToast(message: 'الرجاء ادخال رقم هاتف صحيح', color: Colors.red);
    } else {
      otp(phoneNumber: "+964 ${forgotPasswordController.text}").then((value) {
        print("========================= answer = $value");
        if (value['success']) {
          Navigator.pushNamed(context, Routes.otpScreen, arguments: {
            'title': 'نسيت كلمة المرور',
            'userData': {
              "phoneNumber": "+964 ${forgotPasswordController.text}",
              "type": "forget",
            }
          });
        }
      });
    }
  }

  // ! CHANGE PASSWORD

  changePassword({
    required String phoneNumber,
    required String newPassword,
    required context,
  }) {
    isLoading = true;
    notifyListeners();
    ApiHelper.postData(url: EndPoints.forgetPassword, body: {
      'phoneNumber': phoneNumber,
      'password': newPassword,
    }).then((value) {
      isLoading = false;
      notifyListeners();
      defaultToast(message: 'تم تغير كلمة المرور بنجاح', color: Colors.green);
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.signInScreen, (route) => false);
      print(value);
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
      defaultToast(message: 'تحقق من اتصالك بالانترنت', color: Colors.red);
      print("ERROR IN CHANGE PASSWORD = $e");
    });
  }

  //! SIGN OUT

  signOut({
    required context,
  }) {
    SharedHelper.removeData(key: 'token').then((value) async {
      userModel = null;
      doctorModel = null;
      EndPoints.token = null;
      
      await SharedHelper.removeData(key: 'userId');
      print(SharedHelper.getData(key: 'userId'));
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.signInScreen, (route) => false);
    }).catchError((e) {
      print("Error SIGN OUT  = $e");
    });
    print("TOKEN = ${SharedHelper.getData(key: 'token')}");
  }
}
