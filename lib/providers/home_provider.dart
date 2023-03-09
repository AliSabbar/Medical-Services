import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/components/defaultToast.dart';
import 'package:medical_services/main.dart';
import 'package:medical_services/models/specialty_model.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/network/remote/api_helper.dart';
import 'package:medical_services/screens/appointmentScreen/appointment_screen.dart';
import 'package:medical_services/screens/favoriteScreen/favorite_screen.dart';
import 'package:medical_services/screens/guestScreen/guest_screen.dart';
import 'package:medical_services/screens/homeScreen/home_screen.dart';
import 'package:medical_services/screens/notificationsScreen/notifications_screen.dart';
import 'package:medical_services/settings/colors.dart';

import '../screens/addAppointmentScreen/add_appointment_screen.dart';

class HomeProvider extends ChangeNotifier {
  int currentIndex = 0;
  List appbarTitle = [
    'مرحبا ,',
    'حجوزاتي',
    false ? 'المفضلة' : 'اضافة حجز',
    'الاشعارات'
  ];

  List<Widget> screens = [
    const HomeScreen(),
    EndPoints.token.isEmpty ? const GuestScreen() : const AppointmentScreen(),
    EndPoints.token.isEmpty
        ? const GuestScreen()
        : false
            ? AddAppointmentScreen()
            : const FavoriteScreen(),
   EndPoints.token.isEmpty ? const GuestScreen() :  const NotificationsScreen(),
  ];
// ! SPECIALTY
  late SpecialtyModel specialtyModel;
  List specialtyList = [];
  bool isLoading = false;

  //* MOVE FORM PAGE TO ANOTHER [NAV BAR]

  moveNavPages({required index}) {
    currentIndex = index;
    notifyListeners();
  }

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
