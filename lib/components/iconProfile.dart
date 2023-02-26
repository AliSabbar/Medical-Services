import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget IconProfile(
    {required String? imgUrl, double size = 20, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 15,
      child: SvgPicture.asset(
        imgUrl!,
        width: size,
        height: size,
      ),
    ),
  );
}
