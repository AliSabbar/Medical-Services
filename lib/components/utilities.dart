import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../settings/colors.dart';

// the button
Widget defaultTextButton({required String text}) {
  return TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      minimumSize: const Size(180, 60),
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

// profile container
Widget defaultProfileContainer({ String? SvgURL}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(30),
      ),
      color: AppColors.secondaryColor,
    ),
    height: 305,
    width: 410,
    child: SvgPicture.asset(
      SvgURL!,
      width: 232,
      height: 262.04,
    ),
  );
}
