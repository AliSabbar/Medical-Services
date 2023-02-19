import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_services/components/defaultProfileContainer.dart';
import 'package:medical_services/components/defaultTextField.dart';
import 'package:medical_services/settings/colors.dart';

import '../../components/defaultButton.dart';
import '../../settings/routes_manger.dart';

// ignore: must_be_immutable
class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthMQ = MediaQuery.of(context).size.width;
    double heightMQ = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // the logo and the blue container
              defaultProfileContainer(
                  svgURL: 'assets/images/404Logo.svg',
                  height: widthMQ >= 768 ? 320 : 260),
              SizedBox(
                height: heightMQ * 0.02,
              ),
              // first text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'تسجيل الدخول ',
                      style: TextStyle(
                          fontSize: widthMQ >= 768 ? 40 : 32.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor),
                    ),
                    SizedBox(
                      height: heightMQ * 0.01,
                    ),
                    //second text
                    Text(
                      'لاتحتار طبيبك وياك بكل مكان',
                      style: TextStyle(
                          fontSize: widthMQ >= 768 ? 20 : 15.sp.sp,
                          color: AppColors.blackColor),
                    ),
                    SizedBox(
                      height: heightMQ * 0.02,
                    ),
                    //textfield for the number
                    Text(
                      'رقم الهاتف',
                      style: TextStyle(
                          fontSize: widthMQ >= 768 ? 20 : 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor),
                    ),
                    SizedBox(
                      height: heightMQ * 0.01,
                    ),
                    defaultTextField(
                      hintText: 'ادخل رقم الهاتف',
                      controller: phoneNumberController,
                      keyboardType: const TextInputType.numberWithOptions(),
                      validator: (s) {
                        return null;
                      },
                    ),
                    SizedBox(
                      height: heightMQ * 0.03,
                    ),
                    //second textfield for the password
                    Text(
                      'كلمة المرور',
                      style: TextStyle(
                          fontSize: widthMQ >= 768 ? 20 : 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor),
                    ),
                    SizedBox(
                      height: heightMQ * 0.01,
                    ),
                    defaultTextField(
                      hintText: 'ادخل كلمة المرور',
                      controller: phoneNumberController,
                      validator: (s) {
                        return null;
                      },
                      // obscureText: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: heightMQ * 0.03,
              ),
              //button sign in
              Center(
                child: Column(
                  children: [
                    defaultButton(text: 'تسجيل الدخول', onPressed: (){}),
                    //other texts
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ليس لديك حساب؟',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: widthMQ >= 768 ? 20 : 15.sp,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'انشاء حساب',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: widthMQ >= 768 ? 20 : 15.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.homeScreenRoute, (route) => false);
                      },
                      child: Text(
                        'المتابعة كزائر',
                        style: TextStyle(
                          color: AppColors.greyColor,
                          fontSize: widthMQ >= 768 ? 20 : 15.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
