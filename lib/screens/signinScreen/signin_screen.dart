import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:medical_services/components/defaultProfileContainer.dart';
import 'package:medical_services/components/defaultTextField.dart';
import 'package:medical_services/components/authTitleWidget.dart';
import 'package:medical_services/components/defaultToast.dart';
import 'package:medical_services/models/signIn_user_model.dart';
import 'package:medical_services/models/signUp_user_model.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:provider/provider.dart';

import '../../components/defaultButton.dart';
import '../../components/defaultPhoneNumber.dart';
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

  TextEditingController forgotPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    forgotPasswordController.dispose();
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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  // the logo and the blue container
                  defaultProfileContainer(
                      child: SvgPicture.asset('assets/images/404Logo.svg'),
                      height: Orientation.landscape == orientation ? 320 : 285),
                  SizedBox(
                    height: 10.h,
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
                          height: Orientation.landscape == orientation
                              ? 20.h
                              : 10.h,
                        ),
                        const AuthTitleWidget(title: 'رقم الهاتف'),
                        DefaultPhoneNumber(
                            phoneNumberController: phoneNumberController),
                        SizedBox(
                          height: 10.h,
                        ),
                        //second textfield for the password
                        const AuthTitleWidget(title: 'كلمة المرور'),
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
                            if (s!.isEmpty) {
                              return "لايمكن ان يكون هذا الحقل فارغا";
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: AlertDialog(
                                        title: const Text("تغير كلمة المرور"),
                                        content: DefaultPhoneNumber(
                                            phoneNumberController:
                                                forgotPasswordController),
                                        actions: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(ctx).pop();
                                                  forgotPasswordController
                                                      .clear();
                                                },
                                                child: const Text("رجوع"),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  context
                                                      .read<AuthProvider>()
                                                      .forgotPassword(
                                                          forgotPasswordController:
                                                              forgotPasswordController,
                                                          context: context);

                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                                child: const Text("ارسال"),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 5.w, top: 8.h),
                                child: Text(
                                  'نسيت كلمة المرور؟',
                                  style: TextStyle(
                                    color: AppColors.greyColor,
                                    fontSize:
                                        Orientation.landscape == orientation
                                            ? 20.sp
                                            : 13.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Orientation.landscape == orientation
                      ? SizedBox(
                          height: 30.h,
                        )
                      : SizedBox(
                          height: 10.h,
                        ),
                  //!button sign in
                  Center(
                    child: Column(
                      children: [
                        Visibility(
                          visible: provWatch.isButtonShowing,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: defaultButton(
                              text: 'تسجيل الدخول',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  provRead.signIn(
                                      context: context,
                                      body: SignInUserModel(
                                              phoneNumber:
                                                  "+964 ${phoneNumberController.text}",
                                              password: passwordController.text)
                                          .toJson());
                                }
                                // force keyboard go down
                                FocusScope.of(context).unfocus();
                              },
                              height: Orientation.landscape == orientation
                                  ? 75
                                  : 60),
                        ),

                        SizedBox(
                          height: 12.h,
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
                            SizedBox(
                              width: 5.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.choiceAccount);
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
                        SizedBox(
                          height: 10.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                Routes.homeLayoutRoute, (route) => false);
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
      ),
    );
  }
}
