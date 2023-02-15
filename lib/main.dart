import 'package:flutter/material.dart';
import 'package:medical_services/screens/adminScreens/admin_screen.dart';
import 'package:medical_services/screens/homeScreen/home_screen.dart';
import 'package:medical_services/screens/splashScreen/splash_screen.dart';
import 'package:medical_services/settings/routes_manger.dart';
import 'package:medical_services/settings/themes.dart';

import 'network/local/shared_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHelper.init();
  dynamic onBoarding = SharedHelper.getData(key: "OnBoarding");
  Widget startWidget;
  if (onBoarding != null) {
    startWidget = HomeScreen(); 
  } else {
    startWidget = const SplashScreen();
  }
  runApp(MyApp(
    startWidget: startWidget,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.startWidget});

  Widget startWidget;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Services',
      debugShowCheckedModeBanner: false,
      theme: lightTheme, //? <-- change theme
      home: Directionality(
          textDirection: TextDirection.rtl,
          child: startWidget //! THIS IS YOUR HOME WIDGET
          ),
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
