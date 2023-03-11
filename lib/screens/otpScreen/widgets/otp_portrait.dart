import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../../components/defaultButton.dart';
import '../../../settings/colors.dart';

class OtpPortrait extends StatelessWidget {
  OtpPortrait({super.key, this.userData});

  String? otpCode;

  var userData;

  @override
  Widget build(BuildContext context) {
    print(userData['type']);
    double wMQ = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: wMQ >= 768 ? 400.h : 350.h,
            child: SvgPicture.asset(
              'assets/images/forgotPassword.svg',
            ),
          ),
          Text(
            "التحقق من رقمك",
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          Column(
            children: [
              Text(
                'ادخل رمز التحقق المرسل الى رقم الهاتف',
                style: TextStyle(fontSize: 15.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              //! change this when API WORK
              Text(
                userData['phoneNumber'].toString(),
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryColor),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: OtpTextField(
              numberOfFields: 4,
              filled: true,
              fillColor: AppColors.containerColor,
              fieldWidth: 60.w,
              autoFocus: false,
              focusedBorderColor: AppColors.primaryColor,
              enabledBorderColor: AppColors.containerColor,
              showFieldAsBox: true,
              borderRadius: BorderRadius.circular(20.r),
              borderWidth: 2,
              // onCodeChanged: (String code) {
              //   //handle validation or checks here
              //   print(code);
              // },
              onSubmit: (String verificationCode) async {
                print(verificationCode);
                await context.read<AuthProvider>().verifyOtp(
                    phoneNumber: userData['phoneNumber'],
                    otpCode: verificationCode,
                    context: context,
                    type: userData['type']
                    );
                print('Code entered is $verificationCode');
              },
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Row(
              children: [
                Text(
                  'اعادة ارسال الرمز : ',
                  style: TextStyle(fontSize: 15.sp),
                ),
                // ! Timer I will Do IT Later 💀
                Text("1:17"),
                TextButton(
                    onPressed: () {
                      context
                          .read<AuthProvider>()
                          .otp(phoneNumber: userData['phoneNumber']);
                    },
                    child: Text(
                      "اعادة ارسال رمز",
                      style: TextStyle(fontSize: 15.sp),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
