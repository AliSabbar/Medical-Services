import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../settings/colors.dart';
import 'defaultTextField.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return defaultTextField(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            'assets/icons/search.svg',
            color: AppColors.greyColor,
          ),
        ),
        hintText: 'ابحث عن عيادة, طبيب',
        controller: controller,
        validator: (s) {});
  }
}
