import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../settings/colors.dart';

class DefaultProfileInfoCard extends StatelessWidget {
  const DefaultProfileInfoCard(
      {Key? key,
      required this.ContainerColor,
      required this.title,
      required this.rating,
      required this.iconUrl})
      : super(key: key);
  // ignore: non_constant_identifier_names
  final Color ContainerColor;
  final String title;
  final String rating;
  final String iconUrl;
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) => Container(
              height: 77.h,
              width: 111.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: ContainerColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Orientation.landscape == orientation
                            ? 20.sp
                            : 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        rating,
                        style: TextStyle(
                            fontSize: Orientation.landscape == orientation
                                ? 20.sp
                                : 15.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      SvgPicture.asset(
                        iconUrl,
                        width: 22,
                        height: 22,
                      ),
                    ],
                  )
                ],
              ),
            ));
  }
}
