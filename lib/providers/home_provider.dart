import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/screens/appointmentScreen/appointment_screen.dart';
import 'package:medical_services/screens/favoriteScreen/favorite_screen.dart';
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
    HomeScreen(),
    AppointmentScreen(),
    true ? AddAppointmentScreen() : FavoriteScreen(),
    NotificationsScreen(),
  ];

  //* MOVE FORM PAGE TO ANOTHER [NAV BAR]

  moveNavPages({required index}) {
    currentIndex = index;
    notifyListeners();
  }
} 
