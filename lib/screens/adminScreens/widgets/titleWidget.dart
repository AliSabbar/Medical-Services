import 'package:flutter/material.dart';

import '../../../settings/colors.dart';

Widget customTitleWidget({
  required text,
  required context,
}) {
  double heightMQ = MediaQuery.of(context).size.height;
  return Column(children: [
    SizedBox(
      height: heightMQ * 0.01,
    ),
    Text(
      text,
      style:
          TextStyle(fontWeight: FontWeight.bold, color: AppColors.blackColor),
    ),
    SizedBox(
      height: heightMQ * 0.01,
    )
  ]);
}
