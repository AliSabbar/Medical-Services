import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/screens/choiceAcc/widgets/accType.dart';
import 'package:medical_services/settings/colors.dart';

import '../../settings/routes_manger.dart';

class ChoiceAccount extends StatelessWidget {
  const ChoiceAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: OrientationBuilder(
        builder: (context, orientation) => Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      color: AppColors.secondaryColor,
                      width: 390.w,
                      height: 284.h,
                    ),
                    Positioned(
                      top: 45,
                      child: SvgPicture.asset(
                        'assets/images/signChoice.svg',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'انشاء حساب',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'اختر نوع الحساب',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AccTypeWidget(
                      svgUrl: 'assets/images/patient.svg',
                      title: 'مريض',
                      onTap: () {
                        Navigator.pushNamed(context, Routes.signUpScreen);
                      },
                      sizedBoxHeight: 5.h,
                      svgHeight: 115.62.h,
                      svgWidth: 91.w,
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    AccTypeWidget(
                      svgUrl: 'assets/images/medicalServices.svg',
                      title: 'تقديم خدمة',
                      onTap: () {
                        Navigator.pushNamed(context, Routes.providingService);
                      },
                      sizedBoxHeight: 14.h,
                      svgWidth: 142.44.w,
                      svgHeight: 107.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'لديك حساب بالفعل؟',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Orientation.landscape == orientation
                            ? 25.sp
                            : 18.sp,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: Orientation.landscape == orientation
                              ? 25.sp
                              : 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
