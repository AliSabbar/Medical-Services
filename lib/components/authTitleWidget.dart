import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../settings/colors.dart';

class AuthTitleWidget extends StatelessWidget {
  const AuthTitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 8.h,
      ),
      Text(
        title,
        style:
            TextStyle(fontWeight: FontWeight.bold, color: AppColors.blackColor),
      ),
      SizedBox(
        height: 10.h,
      )
    ]);
  }
}
