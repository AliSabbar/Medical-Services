import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../settings/colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/notifications-off.svg',
                color: AppColors.primaryColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "لا يوجد اشعارات",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
