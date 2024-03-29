import 'package:flutter/material.dart';
import 'package:medical_services/settings/colors.dart';

Widget defaultTextField({
  required String hintText,
  required TextEditingController controller,
  String? initialValue,
  TextDirection? textDirection,
  TextInputType? keyboardType,
  bool obscureText = false,
  bool readOnly = false,
  bool enableInteractiveSelection = true,
  bool? enabled = true,
  required String? Function(String?) validator,
  Function(String)? onChanged,
  ValueChanged<String>? onFieldSubmitted,
  VoidCallback? onTap,
  double? width,
  double? height,
  double borderRadius = 20,
  Widget? prefixIcon,
  Widget? suffixIcon,
  int? minLines,
  int? maxLines,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        color: AppColors.textfieldColor,
        borderRadius: BorderRadius.circular(borderRadius)),
    child: TextFormField(
      textDirection: textDirection,
      minLines: minLines,
      maxLines: maxLines,
      initialValue: initialValue,
      readOnly: readOnly,
      enabled: enabled,
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
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.greyColor),
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        //! add the fixed border
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
              color: AppColors.textfieldColor, width: 2), //<-- SEE HERE
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
              color: AppColors.textfieldColor, width: 2), //<-- SEE HERE
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
              color: AppColors.textfieldColor, width: 2), //<-- SEE HERE
        ),
      ),
    ),
  );
}
