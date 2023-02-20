import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_services/components/defaultButton.dart';
import 'package:medical_services/settings/colors.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.title});
  final title;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title.toString()),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
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
                    "07746140233",
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
              OtpTextField(
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
                onCodeChanged: (String code) {
                  //handle validation or checks here
                  print("object");
                },
              ),
              SizedBox(
                height: 10.h,
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
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              defaultButton(
                  text: 'تحقق',
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
