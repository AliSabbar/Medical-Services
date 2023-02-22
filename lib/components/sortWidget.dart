import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../settings/colors.dart';

class SortWidget extends StatelessWidget {
  const SortWidget({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: AppColors.secondaryColor,
      label: Text(text),
      labelStyle: TextStyle(
          fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.white),
      avatar:  Icon(
        icon,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}
