import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../settings/colors.dart';

class MissDoctor extends StatelessWidget {
  const MissDoctor({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 357.w,
          height: 167.h,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.containerColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "احصل على الرعاية الطبية",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "الافضل !",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "تطبيق عافيتك يوفر لك افضل",
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 20.w,
          bottom: -1.h,
          child: SvgPicture.asset('assets/images/doctorHomeScreen.svg'),
        ),
      ],
    );
  }
}
