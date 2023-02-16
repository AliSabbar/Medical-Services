import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_services/network/local/shared_helper.dart';
import 'package:medical_services/screens/splashScreen/widgets/onboarding_landscape.dart';
import 'package:medical_services/screens/splashScreen/widgets/onboarding_portrait.dart';
import 'package:medical_services/settings/colors.dart';

import '../../settings/routes_manger.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: OrientationBuilder(builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return const OnBoardingPortrait();
            }
    
    //*  landscape
    
            else {
              return const OnBoardingLandscape();
            }
          }),
        ),
      ),
    );
  }
}
