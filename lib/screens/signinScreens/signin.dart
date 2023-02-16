import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_services/components/defaultTextField.dart';
import 'package:medical_services/components/utilities.dart';
import 'package:medical_services/settings/colors.dart';

// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  TextEditingController controllerTextField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // the logo and the blue container
              defaultProfileContainer(SvgURL: 'assets/images/404Logo.svg'),
              // first text
              Padding(
                padding: const EdgeInsets.only(top: 25, right: 20),
                child: Text(
                  'تسجيل الدخول ',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor),
                ),
              ),
              //second text
              Padding(
                padding: const EdgeInsets.only(bottom: 15, right: 20),
                child: Text(
                  'لاتحتار طبيبك وياك بكل مكان',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackColor),
                ),
              ),
              //textfield for the number
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 7, right: 20),
                child: Text(
                  'رقم الهاتف',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: defaultTextField(
                      hintText: 'ادخل رقم الهاتف',
                      controller: controllerTextField,
                      validator: (s) {
                        return null;
                      },
                      keyboardType: const TextInputType.numberWithOptions(),
                      width: 370,
                      height: 65,
                    ),
                  ),
                  //the flag
                  Positioned(
                    right: 340,
                    top: 15,
                    child: SvgPicture.asset(
                      'assets/images/iraq.svg',
                      width: 35,
                      height: 35,
                    ),
                  ),
                  //the fixed number
                  Positioned(
                    right: 300,
                    top: 18,
                    child: Text(
                      '+964',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              //second textfield for the password
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 7, right: 20),
                child: Text(
                  'كلمة المرور',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: defaultTextField(
                  hintText: 'ادخل كلمة المرور',
                  controller: controllerTextField,
                  validator: (s) {
                    return null;
                  },
                  obscureText: true,
                  width: 370,
                  height: 65,
                ),
              ),
              //button sign in
              Center(
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: defaultTextButton(text: 'تسجيل الدخول')),
                    //other texts
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'ليس لديك حساب؟',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'انشاء حساب',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'المتابعة كزائر',
                        style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
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
