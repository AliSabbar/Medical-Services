import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_services/screens/homeScreen/home_screen.dart';
import 'package:medical_services/screens/signinScreen/signin_screen.dart';
import 'package:medical_services/screens/splashScreen/splash_screen.dart';
import '../screens/signupScreen/signup_screen.dart';

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
  static const String signInScreen = "/signInScreen";
  static const String signUpScreen = "/signUpScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.signInScreen:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
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
