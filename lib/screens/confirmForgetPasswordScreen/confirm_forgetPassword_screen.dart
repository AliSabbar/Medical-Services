import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_services/components/defaultButton.dart';
import 'package:medical_services/components/defaultTextField.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:provider/provider.dart';

class ConfirmForgetPasswordScreen extends StatefulWidget {
  const ConfirmForgetPasswordScreen({super.key, required this.phoneNumber});
  final phoneNumber;
  @override
  State<ConfirmForgetPasswordScreen> createState() =>
      _ConfirmForgetPasswordScreenState();
}

class _ConfirmForgetPasswordScreenState
    extends State<ConfirmForgetPasswordScreen> {
  TextEditingController forgetPasswordController = TextEditingController();
  @override
  void dispose() {
    forgetPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تغير كلمة المرور'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset('assets/images/c_forgetPassword.svg'),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "رقم هاتفك",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
                ),
                Text(
                  widget.phoneNumber['phoneNumber'].toString(),
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: AppColors.secondaryColor),
                ),
                SizedBox(
                  height: 30.h,
                ),
                defaultTextField(
                    hintText: 'ادخل كلمة المرور الجديدة',
                    controller: forgetPasswordController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "لا يمكن ان يكون هذا الحقل فارغا";
                      }
                    }),
                SizedBox(
                  height: 30.h,
                ),
                context.watch<AuthProvider>().isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : defaultButton(
                        text: 'ناكيد',
                        onPressed: () {
                          context.read<AuthProvider>().changePassword(
                              phoneNumber: widget.phoneNumber['phoneNumber'],
                              newPassword: forgetPasswordController.text,
                              context: context);
                        })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
