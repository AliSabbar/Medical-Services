import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../settings/colors.dart';
import 'defaultTextField.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.controller, this.onChange});
  final TextEditingController controller;
  final Function(String)? onChange;
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
        onChanged: onChange,
        validator: (s) {});
  }
}
