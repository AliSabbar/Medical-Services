import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/components/starsTest/stars.dart';

import '../settings/colors.dart';

class DefaultClinicsCard extends StatelessWidget {
  const DefaultClinicsCard(
      {Key? key,
      required this.ImgUrl,
      required this.title,
      required this.onTap})
      : super(key: key);
  final String ImgUrl;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 155.w,
        height: 178.h,
        decoration: BoxDecoration(
          color: AppColors.backgroundCardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              height: 117.h,
              width: 155.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                    image: NetworkImage(ImgUrl), fit: BoxFit.cover),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            // rating
            Stars(countStar: 5),
          ],
        ),
      ),
    );
  }
}
