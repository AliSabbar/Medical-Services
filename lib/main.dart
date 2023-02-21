import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:medical_services/providers/home_provider.dart';
import 'package:medical_services/providers/upload_image_provider.dart';
import 'package:medical_services/screens/homeLayout/home_layout.dart';
import 'package:medical_services/screens/signinScreen/signin_screen.dart';
import 'package:medical_services/screens/splashScreen/splash_screen.dart';
import 'package:medical_services/settings/routes_manger.dart';
import 'package:medical_services/settings/themes.dart';
import 'package:provider/provider.dart';

import 'network/local/shared_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHelper.init();
  dynamic onBoarding = SharedHelper.getData(key: "OnBoarding");
  Widget startWidget;
  if (onBoarding != null) {
    startWidget = const HomeLayOut();
  } else {
    startWidget = const SplashScreen();
  }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UploadImageProvider()),
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => HomeProvider()),
    ],
    child: MyApp(
      startWidget: startWidget,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startWidget});

  final Widget startWidget;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), //? maybe change it later
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Medical Services',
        debugShowCheckedModeBanner: false,
        theme: lightTheme, //? <-- change theme
        home: const SignInScreen(), //! this is your home widget
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}
