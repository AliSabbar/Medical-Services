import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../settings/colors.dart';

Widget defaultProfileContainer({String? svgURL, double height = 285}) {
  return Container(
    width: double.infinity,
    height: height.h,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(30),
      ),
      color: AppColors.secondaryColor,
    ),
    child: SvgPicture.asset(
      svgURL!,
    ),
  );
}
