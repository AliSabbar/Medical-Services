import 'package:flutter/material.dart';

import '../settings/colors.dart';

Widget defaultTextButton(
    {required String text,
    required onPressed,
    double width = 180,
    double height = 60}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      minimumSize: Size(width, height),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    ),
    child: Text(
      text,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
    ),
  );
}

Widget defaultButton({
   double width = 180,
   double height = 60,
   double fontSize = 18,
   FontWeight fontWeight = FontWeight.w700,
   required text,
   required onPressed,
  
}) {
  return MaterialButton(
    minWidth: 200,
    height: 40,
    onPressed:onPressed,
    color: AppColors.primaryColor,
    textColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child:  Text(
      text,
      style:   TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: Colors.white),
    ),
  );
}
