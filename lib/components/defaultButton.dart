import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../settings/colors.dart';

Widget defaultButton({
  double width = 180,
  double height = 60,
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.bold,
  required text,
  required onPressed,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: width.w,
      height: height.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize.sp,
          color: Colors.white,
        ),
      ),
    ),
  );
}
