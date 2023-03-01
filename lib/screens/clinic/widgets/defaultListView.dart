import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/defaultClinicsCard.dart';

class DefaultListView extends StatelessWidget {
  const DefaultListView({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String imgUrl;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(
                width: 20.w,
              ),
          itemBuilder: (context, index) {
            return DefaultClinicsCard(
              imgUrl: imgUrl,
              onTap: onTap,
              title: title,
            );
            // must take the number of stars
          }),
    );
  }
}
