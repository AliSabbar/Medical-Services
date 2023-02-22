import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../settings/colors.dart';

class AppointmentMessage extends StatelessWidget {
  const AppointmentMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 342.w,
          height: 130.h,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(20.r)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40.r,
                backgroundColor: AppColors.secondaryColor,
              ),
              SizedBox(
                width: 17.w,
              ),
              Expanded(
                child: Text(
                  "اضغط على الحجز لعرض ال QR CODE الخاص بالحجز ",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  maxLines: 2,
                ),
              )
            ],
          ),
          // right: 10,
        ),
        Positioned(
            right: 30.w,
            top: 10.h,
            child: SvgPicture.asset('assets/images/phone_cal.svg')),
      ],
    );
  }
}
