import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    super.key,
    required this.title,
    required this.svgIcon,
    required this.backColor,
    required this.backIconColor,
    required this.onTap,
  });
  final String title;
  final String svgIcon;
  final Color backColor;
  final Color backIconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350.w,
        height: 70.h,
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(children: [
          Container(
            width: 36.w,
            height: 38.h,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: backIconColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: SvgPicture.asset(svgIcon),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}
