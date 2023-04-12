import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/components/starsTest/stars.dart';
import 'package:medical_services/providers/clinics_provider.dart';
import 'package:provider/provider.dart';

import '../../../settings/colors.dart';

class DefaultClinicsCard extends StatelessWidget {
  const DefaultClinicsCard({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.onTap,
    required this.starCount,
  }) : super(key: key);

  final String imgUrl;
  final String title;
  final VoidCallback onTap;
  final starCount;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 155.w,
        height: 200.w,
        decoration: BoxDecoration(
          color: AppColors.backgroundCardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              height: 115.h,
              width: 155.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                image: DecorationImage(
                    image: NetworkImage(imgUrl), fit: BoxFit.cover),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15.sp,
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Stars(countStar: starCount),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
