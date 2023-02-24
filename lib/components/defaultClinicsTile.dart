import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../settings/colors.dart';

class DefaultClinicsTile extends StatelessWidget {
  const DefaultClinicsTile(
      {Key? key, required this.imgUrl, required this.title})
      : super(key: key);
  final String imgUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 302.w,
        height: 111.h,
        decoration: BoxDecoration(
          color: AppColors.backgroundCardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
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
            SizedBox(
              width: 15.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4.h,
                ),
                SvgPicture.asset(
                  'assets/icons/stars.svg',
                  width: 60.w,
                  height: 13.h,
                ),
              ],
            ),
           const Spacer(),
            GestureDetector(
              onTap: () {},
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

                   SizedBox(width: 10.w,)
                
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
