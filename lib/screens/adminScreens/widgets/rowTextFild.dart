import 'package:flutter/material.dart';

import '../../../components/defaultTextField.dart';
import '../../../settings/colors.dart';

Widget rowTextField({
 required context,
  VoidCallback? onTap,
  VoidCallback? secondOnTap,
  required String oneText,
  required String secondText,
  required TextEditingController oneController,
  required TextEditingController secondController,
  required String? Function(String?) oneValidator,
  required String? Function(String?) secondValidator,
}) {
  double widthMQ = MediaQuery.of(context).size.width;
  double heightMQ = MediaQuery.of(context).size.height;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Column(
          children: [
            Text(
              oneText,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.blackColor),
            ),
            SizedBox(
              height: heightMQ * 0.01,
            ),
            defaultTextField(
              onTap: onTap,
              width: widthMQ * 0.65,
              hintText: oneText,
              controller: oneController,
              validator: oneValidator,
            ),
          ],
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Expanded(
        child: Column(
          children: [
            Text(
              secondText,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.blackColor),
            ),
            SizedBox(
              height: heightMQ * 0.01,
            ),
            defaultTextField(
              onTap: secondOnTap,
              width: widthMQ * 0.65,
              hintText: secondText,
              controller: secondController,
              validator: secondValidator,
            ),
          ],
        ),
      ),
    ],
  );
}
