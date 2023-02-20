import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_services/components/defaultProfileContainer.dart';
import 'package:medical_services/components/defaultTextField.dart';
import 'package:medical_services/components/titleWidget.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:provider/provider.dart';

import '../../components/defaultButton.dart';
import '../../settings/routes_manger.dart';

// ignore: must_be_immutable
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
    var provRead = context.read<AuthProvider>();
    var provWatch = context.watch<AuthProvider>();
    return OrientationBuilder(
      builder: (context, orientation) => Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // the logo and the blue container
                defaultProfileContainer(
                    svgURL: 'assets/images/404Logo.svg',
                    height: Orientation.landscape == orientation ? 320 : 285),
                // first text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'تسجيل الدخول ',
                        style: TextStyle(
                            fontSize: Orientation.landscape == orientation
                                ? 40.sp
                                : 32.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor),
                      ),
                      SizedBox(
                        height:
                            Orientation.landscape == orientation ? 10.h : 8.h,
                      ),
                      //second text
                      Text(
                        'لاتحتار طبيبك وياك بكل مكان',
                        style: TextStyle(
                            fontSize: Orientation.landscape == orientation
                                ? 20.sp
                                : 15.sp,
                            color: AppColors.blackColor),
                      ),
                      SizedBox(
                        height:
                            Orientation.landscape == orientation ? 20.h : 10.h,
                      ),
                      const CustomTitleWidget(title: 'رقم الهاتف'),
                      defaultTextField(
                        hintText: 'ادخل رقم الهاتف',
                        controller: phoneNumberController,
                        keyboardType: const TextInputType.numberWithOptions(),
                        validator: (s) {
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      //second textfield for the password
                      const CustomTitleWidget(title: 'كلمة المرور'),
                      defaultTextField(
                        obscureText: provWatch.isVisible,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            provRead.changeEyeValue();
                          },
                          child: provWatch.isVisible
                              ? const Icon(Icons.remove_red_eye_outlined)
                              : const Icon(Icons.remove_red_eye_rounded),
                        ),
                        hintText: 'ادخل كلمة المرور',
                        controller: passwordController,
                        maxLines: 1,
                        validator: (s) {
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Orientation.landscape == orientation
                    ? SizedBox(
                        height: 30.h,
                      )
                    : SizedBox(
                        height: 20.h,
                      ),
                //button sign in
                Center(
                  child: Column(
                    children: [
                      defaultButton(
                          text: 'تسجيل الدخول',
                          onPressed: () {
                            // force keyboard go down
                            FocusScope.of(context).unfocus();
                          },
                          height:
                              Orientation.landscape == orientation ? 75 : 60),

                      SizedBox(
                        height: 10.h,
                      ),
                      //other texts
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'ليس لديك حساب؟',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Orientation.landscape == orientation
                                  ? 20.sp
                                  : 15.sp,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.signUpScreen);
                            },
                            child: Text(
                              'انشاء حساب',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: Orientation.landscape == orientation
                                    ? 20.sp
                                    : 15.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              Routes.homeScreenRoute, (route) => false);
                        },
                        child: Text(
                          'المتابعة كزائر',
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: Orientation.landscape == orientation
                                ? 20.sp
                                : 15.sp,
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
      ),
    );
  }
}
