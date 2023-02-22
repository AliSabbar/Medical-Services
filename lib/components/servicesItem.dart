import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../settings/colors.dart';

class ServicesItem extends StatelessWidget {
  const ServicesItem({
    super.key,
    required this.assetName,
    required this.color,
    required this.onTap,
  });
  final String assetName;
  final VoidCallback onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 80.w,
          height: 80.h,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20.r)),
          child: SvgPicture.asset(assetName),
        ),
      ),
    );
  }
}
