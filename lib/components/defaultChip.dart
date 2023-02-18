import 'package:flutter/material.dart';

import '../settings/colors.dart';

Widget defaultChip({
  required text,
  required onDelete,
}) {
  return Chip(
    backgroundColor: AppColors.secondaryColor,
    label: Text(text),
    labelStyle:
        const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    deleteIcon: const Icon(
      Icons.cancel,
      color: Colors.red,
    ),
    onDeleted: onDelete,
  );
}
