import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_services/screens/choiceAcc/choiceAcc.dart';
import 'package:medical_services/screens/clinic/Clinics.dart';
import 'package:medical_services/screens/clinic/clinicProfile.dart';
import 'package:medical_services/screens/clinic/clinicsNearBy.dart';
import 'package:medical_services/screens/clinic/clinicsTopRated.dart';
import 'package:medical_services/screens/confirmAppointmentScreen/confirmappointment_screen.dart';
import 'package:medical_services/screens/confirmForgetPasswordScreen/confirm_forgetPassword_screen.dart';
import 'package:medical_services/screens/doctorsScreen/doctor_profile.dart';
import 'package:medical_services/screens/guestScreen/guest_screen.dart';
import 'package:medical_services/screens/homeLayout/home_layout.dart';
import 'package:medical_services/screens/homeScreen/home_screen.dart';
import 'package:medical_services/screens/profileScreen/profile_screen.dart';
import 'package:medical_services/screens/providingService/providingService.dart';
import 'package:medical_services/screens/qrCodeScreen/qrCoder_screen.dart';
import 'package:medical_services/screens/settingsScreen/settings_screen.dart';
import 'package:medical_services/screens/signinScreen/signin_screen.dart';
import 'package:medical_services/screens/specialtyScreen/specialty_screen.dart';
import 'package:medical_services/screens/splashScreen/splash_screen.dart';
import '../screens/doctorsScreen/doctors_screen.dart';
import '../screens/otpScreen/otp_screen.dart';
import '../screens/services/doctorService/doctorProfile/sr_doctor_profile_screen.dart';
import '../screens/services/doctorService/doctorProfile/sr_editDoctor_profile_screen.dart';
import '../screens/signupScreen/signup_screen.dart';

class Routes {
  static const String splashScreenRoute = "/splashScreen";
  static const String homeLayoutRoute = "/homeLayout";
  static const String homeScreenRoute = "/homeScreen";
  static const String signInScreen = "/signInScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String otpScreen = "/otpScreen";
  static const String confirmForgetPasswordScreen =
      "/confirmForgetPasswordScreen";
  static const String specialtyScreen = "/specialtyScreen";
  static const String doctorsScreen = "/doctorsScreen";
  static const String choiceAccount = "/ChoiceAccount";
  static const String providingService = "/ProvidingService";
  static const String clinics = "/Clinics";
  static const String clinicsNearBy = "/ClinicsNearBy";
  static const String clinicsTopRated = "/ClinicsTopRated";
  static const String profileScreen = "/profileScreen";
  static const String clinicProfileScreen = "/clinicProfileScreen";
  static const String doctorProfileScreen = "/doctorProfileScreen";
  static const String confirmAppointmentScreen = "/confirmAppointmentScreen";
  static const String qrCoderScreen = "/qrCodeScreen";
  static const String settingsScreen = "/settingsScreen";
  static const String guestScreen = "/guestScreen";
  //! SERVICES ROUTES
  static const String doctorProfileServiceScreen =
      "/doctorProfileServiceScreen";
  static const String editDoctorProfileServiceScreen =
      "/editDoctorProfileServiceScreen";
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
        Object? obj = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => OtpScreen(
                  obj: obj,
                ));
      case Routes.confirmForgetPasswordScreen:
        Object? obj = settings.arguments;

        return MaterialPageRoute(
            builder: (context) => ConfirmForgetPasswordScreen(
                  phoneNumber: obj,
                ));
      case Routes.specialtyScreen:
        return MaterialPageRoute(builder: (context) => const SpecialtyScreen());
      case Routes.doctorsScreen:
        Object? obj = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => DoctorsScreen(
                  specialtyName: obj,
                ));
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
      case Routes.profileScreen:
        Object? obj = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => ProfileScreen(
                  userProfile: obj,
                ));
      case Routes.clinicProfileScreen:
        Object? obj = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => ClinicProfileScreen(
                  clinicModel: obj,
                ));
      case Routes.doctorProfileScreen:
        Object? obj = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => DoctorProfile(
                  doctorModel: obj,
                ));
      case Routes.confirmAppointmentScreen:
        Object? obj = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => ConfirmAppointment(
                  data: obj,
                ));
      case Routes.qrCoderScreen:
        return MaterialPageRoute(builder: (context) => const QrCodeScreen());
      case Routes.settingsScreen:
        return MaterialPageRoute(builder: (context) => const SettingsScreen());
      case Routes.guestScreen:
        return MaterialPageRoute(builder: (context) => const GuestScreen());
      case Routes.doctorProfileServiceScreen:
        return MaterialPageRoute(
            builder: (context) => const SrDoctorProfileScreen());
      case Routes.editDoctorProfileServiceScreen:
        return MaterialPageRoute(
            builder: (context) => const SrEditDoctorProfile());
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
