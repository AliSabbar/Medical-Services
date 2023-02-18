import 'package:flutter/material.dart';

import '../settings/colors.dart';

Widget defaultDropDownButton({
  required value,
  required List items,
  required onChanged,
  double width = double.infinity,
}) {
  return Container(
    width: width,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: AppColors.textfieldColor,
      borderRadius: BorderRadius.circular(15),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton(
          borderRadius: BorderRadius.circular(20),
          style: TextStyle(fontSize: 20, color: AppColors.blackColor),
          value: value,
          items: items.map((e) {
            return DropdownMenuItem(
              alignment: Alignment.center,
              value: e,
              child: Text(e),
            );
          }).toList(),
          onChanged: onChanged
          ),
    ),
  );
}
