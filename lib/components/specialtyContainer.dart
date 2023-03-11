import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_services/settings/colors.dart';

Widget specialtyContainer({
  required String title,
  required String image,
  required VoidCallback onTap,
  double width = 350,
  double height = 70,
  int circleRadius = 20,
  int fontSize = 16,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width.w,
      height: height.h,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: AppColors.backgroundCardColor,
          borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        children: [
          CircleAvatar(
            radius: circleRadius.r,
            backgroundImage: NetworkImage(image.toString()),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Text(
              title,
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize.sp),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    ),
  );
}
