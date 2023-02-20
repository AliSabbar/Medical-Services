import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../settings/colors.dart';


Widget defaultButton({
   double width = 180,
   double height = 60,
   double fontSize = 18,
   FontWeight fontWeight = FontWeight.w700,
   required text,
   required onPressed,
  
}) {
  return MaterialButton(
    elevation: 0.0,
    focusElevation: 0.0,
    hoverElevation: 0.0,
    disabledElevation: 0.0,
    highlightElevation: 0.0,
    minWidth: width.w,
    height: height.h,
    onPressed:onPressed,
    color: AppColors.primaryColor,
    textColor: Colors.white,
    shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.r))),
    child:  Text(
      text,
      style:   TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: Colors.white),
    ),
  );
}
