import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../settings/colors.dart';

class DefaultPhoneNumber extends StatelessWidget {
  const DefaultPhoneNumber({
    super.key,
    required this.phoneNumberController,
  });

  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.w),
      decoration: BoxDecoration(
          color: AppColors.textfieldColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.textfieldColor, width: 2)),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: InternationalPhoneNumberInput(
          onInputChanged: (v) {},
          maxLength: 12,
          errorMessage: "ادخل رقم هاتف صحيح",
          textAlign: TextAlign.left,
          textFieldController: phoneNumberController,
          countries: const ['IQ'],
          inputDecoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
