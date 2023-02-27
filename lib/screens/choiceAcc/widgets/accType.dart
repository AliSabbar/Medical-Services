import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../settings/colors.dart';

class AccTypeWidget extends StatelessWidget {
  const AccTypeWidget(
      {super.key,
      required this.svgUrl,
      required this.title,
      required this.onTap,
      required this.sizedBoxHeight,
      required this.svgHeight,
      required this.svgWidth});
  final String svgUrl;
  final String title;
  final VoidCallback onTap;
  final double sizedBoxHeight;
  final double svgHeight;
  final double svgWidth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.secondaryColor,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.backgroundCardColor,
            borderRadius: BorderRadius.circular(20)),
        width: 164.w,
        height: 166.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: sizedBoxHeight,
            ),
            SvgPicture.asset(
              svgUrl,
              height: svgHeight,
              width: svgWidth,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: 1),
            ),
          ],
        ),
      ),
    );
  }
}
