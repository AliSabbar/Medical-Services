import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_services/providers/doc_clinic_provider.dart';
import 'package:medical_services/providers/upload_image_provider.dart';
import 'package:medical_services/screens/adminScreens/admin_screen.dart';
import 'package:medical_services/screens/homeScreen/home_screen.dart';
import 'package:medical_services/screens/signinScreens/signin_screen.dart';
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
    startWidget = HomeScreen();
  } else {
    startWidget = const SplashScreen();
  }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => DocAndClinicProvider()),
      ChangeNotifierProvider(create: (context) => UploadImageProvider()),
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
        home: AdminPanelScreen(), //! this is your home widget
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}
