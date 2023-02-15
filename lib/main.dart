import 'package:flutter/material.dart';
import 'package:medical_services/screens/adminScreens/admin_screen.dart';
import 'package:medical_services/screens/splashScreen/splash_screen.dart';
import 'package:medical_services/settings/routes_manger.dart';
import 'package:medical_services/settings/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Services',
      debugShowCheckedModeBanner: false,
      theme: lightTheme, //? <-- change theme
      home: Directionality(
          textDirection: TextDirection.rtl,
          child: SplashScreen() //! THIS IS YOUR HOME WIDGET

          ),
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
