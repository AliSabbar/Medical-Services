import 'package:flutter/material.dart';

import '../settings/colors.dart';

class CustomTitleWidget extends StatelessWidget {
  const CustomTitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    double heightMQ = MediaQuery.of(context).size.height;
    return Column(children: [
      SizedBox(
        height: heightMQ * 0.01,
      ),
      Text(
        title,
        style:
            TextStyle(fontWeight: FontWeight.bold, color: AppColors.blackColor),
      ),
      SizedBox(
        height: heightMQ * 0.01,
      )
    ]);
  }
}

