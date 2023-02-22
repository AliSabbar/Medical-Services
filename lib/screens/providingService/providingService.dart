import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/components/defaultButton.dart';
import 'package:medical_services/settings/colors.dart';

import '../../settings/routes_manger.dart';

class ProvidingService extends StatelessWidget {
  const ProvidingService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: OrientationBuilder(
        builder: (context, orientation) => Scaffold(
          body: SafeArea(
              child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                SvgPicture.asset('assets/images/groupServices.svg'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'انضم الان لعائلة',
                  style: TextStyle(
                      fontSize:
                          Orientation.landscape == orientation ? 37.sp : 32.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor),
                ),
                Text(
                  'عـافـيـتـك!',
                  style: TextStyle(
                      fontSize:
                          Orientation.landscape == orientation ? 37.sp : 32.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'لا تفوت الفرصة لجعل عملك اكثر سهولة ودقة!',
                  style: TextStyle(
                      fontSize:
                          Orientation.landscape == orientation ? 21.sp : 16.sp,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 70,
                ),
                defaultButton(text: 'تواصل معنا', onPressed: () {}),
                SizedBox(
                  height: 15,
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
                            ? 22.sp
                            : 17.sp,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.signInScreen);
                      },
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: Orientation.landscape == orientation
                              ? 22.sp
                              : 17.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
