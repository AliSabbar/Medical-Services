import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Stars extends StatelessWidget {
  Stars({Key? key, required this.countStar}) : super(key: key);
  int countStar;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: countStar,
        itemBuilder: (BuildContext context, int index) {
          return SvgPicture.asset(
                'assets/icons/star.svg',
                width: 60,
                height: 13,
              );
        },
      ),
    );
  }
}
