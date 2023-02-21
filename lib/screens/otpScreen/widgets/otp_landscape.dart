import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/defaultButton.dart';
import '../../../settings/colors.dart';

class OtpLandscape extends StatelessWidget {
  const OtpLandscape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double wMQ = MediaQuery.of(context).size.width;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: SvgPicture.asset(
                    'assets/images/forgotPassword.svg',
                    height: wMQ >= 768 ? 500.h : 300.h,
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Text(
                        "التحقق من رقمك",
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
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
                      SizedBox(
                        height: 20.h,
                      ),
                      OtpTextField(
                        numberOfFields: 4,
                        filled: true,
                        fillColor: AppColors.containerColor,
                        fieldWidth: 40.w,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'اعادة ارسال الرمز : ',
                            style: TextStyle(fontSize: 15.sp),
                          ),
                          // ! Timer I will Do IT Later 💀
                          Text("1:17"),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      defaultButton(
                          text: 'تحقق',
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                          })
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
