import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_services/screens/homeScreen/home_screen.dart';
import 'package:medical_services/screens/signinScreen/signin_screen.dart';
import 'package:medical_services/screens/splashScreen/splash_screen.dart';
import '../screens/otpScreen/otp_screen.dart';
import '../screens/signupScreen/signup_screen.dart';

class Routes {
  static const String splashScreenRoute = "/splashScreen";
  static const String homeScreenRoute = "/homeScreen";
  static const String signInScreen = "/signInScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String otpScreen = "/otpScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.otpScreen:
        Object? title = settings.arguments;
        return MaterialPageRoute(builder: (_) => OtpScreen(title: title,));
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
