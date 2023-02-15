import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_services/screens/adminScreens/AddSpecialtyScreen/add_specialty_screen.dart';
import 'package:medical_services/screens/adminScreens/addClinicScreen/add_clinic_screen.dart';
import 'package:medical_services/screens/adminScreens/addDoctorScreen/add_doctors_screen.dart';
import 'package:medical_services/screens/adminScreens/admin_screen.dart';
import 'package:medical_services/screens/adminScreens/showClinicsScreen/show_clinics_screen.dart';
import 'package:medical_services/screens/adminScreens/showDoctorsScreen/show_doctors_screen.dart';
import 'package:medical_services/screens/homeScreen/home_screen.dart';
import 'package:medical_services/screens/splashScreen/splash_screen.dart';

import '../screens/adminScreens/showUsersScreen/show_users_screen.dart';

class Routes {
  // ! ADMIN PANEL ROUTES

  static const String adminPanelScreenRoute = "/adminScreen";
  static const String addDoctorScreenRoute = "/addDoctorScreen";
  static const String showDoctorsScreenRoute = "/showDoctorsScreen";
  static const String addClinicScreenRoute = "/addClinicScreen";
  static const String showClinicScreenRoute = "/showClinicScreen";
  static const String addSpecialtyScreenRoute = "/addSpecialtyScreen";
  static const String showUsersScreenRoute = "/showUsersScreen";
  // ! ADMIN PANEL ROUTES

  static const String splashScreenRoute = "/splashScreen";
  static const String homeScreenRoute = "/homeScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      // ! ADMIN PANEL ROUTES
      case Routes.adminPanelScreenRoute:
        return MaterialPageRoute(builder: (_) => AdminPanelScreen());
      case Routes.addDoctorScreenRoute:
        return MaterialPageRoute(builder: (_) => AddDoctorScreen());
      case Routes.showDoctorsScreenRoute:
        return MaterialPageRoute(builder: (_) => ShowDoctorsScreen());
      case Routes.addClinicScreenRoute:
        return MaterialPageRoute(builder: (_) => AddClinicScreen());
      case Routes.showClinicScreenRoute:
        return MaterialPageRoute(builder: (_) => ShowClinicsScreen());
      case Routes.addSpecialtyScreenRoute:
        return MaterialPageRoute(builder: (_) => AddSpecialtyScreen());
      case Routes.showUsersScreenRoute:
        return MaterialPageRoute(builder: (_) => ShowUsersScreen());
      //! ADMIN PANEL ROUTES
      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (_) => unDefinedPage());
  }
}

Widget unDefinedPage() {
  return Scaffold(
      body: Center(
          child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Page Not Found",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
      SvgPicture.asset("assets/images/404Logo.svg"),
    ],
  )));
}
