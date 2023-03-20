import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/components/starsTest/stars.dart';

import '../../../settings/colors.dart';

class DefaultClinicsTile extends StatelessWidget {
  const DefaultClinicsTile(
      {Key? key,
      required this.imgUrl,
      required this.title,
      required this.starCount,
      required this.onTap})
      : super(key: key);
  final String imgUrl;
  final String title;
  final int starCount;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundCardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: 115.w,
                height: 111.h,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(imgUrl), fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stars(countStar: starCount),
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  Text(
                    'عرض المزيد',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greyColor),
                  ),
                  SvgPicture.asset('assets/icons/arrowside.svg'),
                  SizedBox(
                    width: 15.w,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
