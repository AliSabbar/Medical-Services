import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_services/screens/choiceAcc/choiceAcc.dart';
import 'package:medical_services/screens/clinic/Clinics.dart';
import 'package:medical_services/screens/clinic/clinicsNearBy.dart';
import 'package:medical_services/screens/clinic/clinicsTopRated.dart';
import 'package:medical_services/screens/homeLayout/home_layout.dart';
import 'package:medical_services/screens/homeScreen/home_screen.dart';
import 'package:medical_services/screens/providingService/providingService.dart';
import 'package:medical_services/screens/signinScreen/signin_screen.dart';
import 'package:medical_services/screens/specialtyScreen/specialty_screen.dart';
import 'package:medical_services/screens/splashScreen/splash_screen.dart';
import '../screens/doctorsScreen/doctors_screen.dart';
import '../screens/otpScreen/otp_screen.dart';
import '../screens/signupScreen/signup_screen.dart';

class Routes {
  static const String splashScreenRoute = "/splashScreen";
  static const String homeLayoutRoute = "/homeLayout";
  static const String homeScreenRoute = "/homeScreen";
  static const String signInScreen = "/signInScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String otpScreen = "/otpScreen";
  static const String specialtyScreen = "/specialtyScreen";
  static const String doctorsScreen = "/doctorsScreen";
  static const String choiceAccount = "/ChoiceAccount";
  static const String providingService = "/ProvidingService";
  static const String clinics = "/Clinics";
  static const String clinicsNearBy = "/ClinicsNearBy";
  static const String clinicsTopRated = "/ClinicsTopRated";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.homeLayoutRoute:
        return MaterialPageRoute(builder: (context) => const HomeLayOut());
      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.signInScreen:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case Routes.otpScreen:
        Object? title = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => OtpScreen(
                  title: title,
                ));
      case Routes.specialtyScreen:
        return MaterialPageRoute(builder: (context) => const SpecialtyScreen());
      case Routes.doctorsScreen:
        return MaterialPageRoute(builder: (context) => const DoctorsScreen());
      case Routes.choiceAccount:
        return MaterialPageRoute(builder: (context) => const ChoiceAccount());
      case Routes.providingService:
        return MaterialPageRoute(
            builder: (context) => const ProvidingService());
      case Routes.clinics:
        return MaterialPageRoute(builder: (context) => const ClinicsScreen());
      case Routes.clinicsNearBy:
        return MaterialPageRoute(builder: (context) => const ClinicsNearBy());
      case Routes.clinicsTopRated:
        return MaterialPageRoute(builder: (context) => const ClinicsTopRated());
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
