import 'package:flutter/material.dart';

import '../../../components/defaultButton.dart';
import '../../../components/defaultChip.dart';
import '../../../components/defaultDropDownButton.dart';
import '../../../components/defaultTextField.dart';

Widget addDoctors({
  required context,
  required controller,
}) {
  double widthMQ = MediaQuery.of(context).size.width;
  double heightMQ = MediaQuery.of(context).size.height;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: defaultTextField(
              width: widthMQ * 0.65,
              hintText: 'ادخل رقم الهاتف',
              controller: controller,
              validator: (s) {
                return null;
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 100,
            height: 40,
            child: defaultButton(text: 'اضافة', onPressed: () {}, fontSize: 15),
          ),
        ],
      ),
      SizedBox(
        height: heightMQ * 0.01,
      ),
      Wrap(
        spacing: 8,
        children: List.generate(
            5, (index) => defaultChip(text: 'data', onDelete: () {})),
      ),
    ],
  );
}
