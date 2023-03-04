import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../settings/colors.dart';

class AppointmentMessage extends StatelessWidget {
  const AppointmentMessage({
    super.key,
    required this.text,
   required this.svgPicture,
   required this.right,
   required this.top ,
   required this.width,
  });
  final String text;
  final String svgPicture;
  final double right;
  final double top;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 342.w,
          // height: 130.h,
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
                  text,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
            ],
          ),
          // right: 10,
        ),
        Positioned(
            right: right.w,
            top: top.h,
            child: SvgPicture.asset(
              svgPicture,
              width: width,
            )),
      ],
    );
  }
}
