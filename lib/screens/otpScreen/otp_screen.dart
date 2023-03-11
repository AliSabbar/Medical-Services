import 'package:flutter/material.dart';
import 'package:medical_services/screens/otpScreen/widgets/otp_landscape.dart';
import 'package:medical_services/screens/otpScreen/widgets/otp_portrait.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.obj});
  final obj;
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: Text(obj['title'].toString()),
            ),
            body: OrientationBuilder(builder: (context, orientation) {
              // ! PORTRAIT
              if (Orientation.portrait == orientation) {
                return  OtpPortrait(userData: obj['userData'],);
              }
              // ! LANDSCAPE
              else {
                return const OtpLandscape();
              }
            })));
  }
}
