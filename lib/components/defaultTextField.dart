import 'package:flutter/material.dart';
import 'package:medical_services/settings/colors.dart';

Widget defaultTextField(
    {required String hintText,
    required TextEditingController controller,
    String? initialValue,
    TextInputType? keyboardType,
    bool obscureText = false,
    bool readOnly = false,
    bool enableInteractiveSelection = true,
    required String? Function(String?) validator,
    Function(String)? onChanged,
    ValueChanged<String>? onFieldSubmitted,
    VoidCallback? onTap,
    double? width,
    double? height,
    double borderRaduis = 20,
    Widget? prefixIcon}) {
  return SizedBox(
    width: width,
    height: height,
    child: TextFormField(
      initialValue: initialValue,
      readOnly: readOnly,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      // cursorHeight: 20,
      autofocus: false,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      enableInteractiveSelection: enableInteractiveSelection,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.greyColor),
        //! add the fixed border
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRaduis),
          borderSide: BorderSide(
              color: AppColors.textfieldColor, width: 2), //<-- SEE HERE
        ),
      ),
    ),
  );
}
