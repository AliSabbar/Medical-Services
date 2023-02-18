import 'package:flutter/material.dart';

import '../../../components/defaultButton.dart';
import '../../../components/defaultChip.dart';
import '../../../components/defaultDropDownButton.dart';

Widget addSpecialty({
  required value,
  required List items,
  required onChanged,
  required context,
}) {
  double widthMQ = MediaQuery.of(context).size.width;
  double heightMQ = MediaQuery.of(context).size.height;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          defaultDropDownButton(
              width: widthMQ * 0.54,
              value: value,
              items: items,
              onChanged: onChanged),
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
