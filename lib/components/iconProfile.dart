import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget iconProfile(
    {required String? imgUrl, double size = 25, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 20.r,
      child: SvgPicture.asset(
        imgUrl!,
        width: size,
        height: size,
      ),
    ),
  );
}
