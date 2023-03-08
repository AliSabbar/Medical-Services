import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:medical_services/components/defaultButton.dart';
import 'package:medical_services/components/defaultDropDownButton.dart';
import 'dart:ui' as ui;
import 'package:medical_services/components/defaultTextField.dart';
import 'package:medical_services/components/authTitleWidget.dart';
import 'package:medical_services/components/uploadImageWidget.dart';
import 'package:medical_services/models/signUp_user_model.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:medical_services/providers/upload_image_provider.dart';
import 'package:provider/provider.dart';

import '../../settings/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneNumberController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    ageController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<UploadImageProvider>().file = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provRead = context.read<AuthProvider>();
    var provWatch = context.watch<AuthProvider>();
    return SafeArea(
      child: Directionality(
        textDirection: ui.TextDirection.rtl,
        child: OrientationBuilder(
          builder: (context, orientation) => Scaffold(
            appBar: AppBar(
              title: const Text("انشاء حساب"),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      const UploadImageWidget(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 8.h,
                          ),
                          const AuthTitleWidget(title: 'اسمك الثلاثي'),
                          defaultTextField(
                              hintText: 'ادخل اسمك الثلاثي',
                              controller: userNameController,
                              validator: (s) {
                                if (s!.isEmpty) {
                                  return "لايمكن ان يكون هذا الحقل فارغا";
                                } else if (s.length <= 7 || s.length >= 20) {
                                  return "ادخل اسمك الثلاثي";
                                }
                              }),
                          SizedBox(
                            height: 8.h,
                          ),
                          const AuthTitleWidget(title: 'رقم الهاتف'),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.h, vertical: 5.w),
                            decoration: BoxDecoration(
                                color: AppColors.textfieldColor,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: AppColors.textfieldColor, width: 2)),
                            child: Directionality(
                              textDirection: ui.TextDirection.ltr,
                              child: InternationalPhoneNumberInput(
                                onSubmit: () {},
                                onInputChanged: (v) {},
                                maxLength: 12,
                                errorMessage: "ادخل رقم هاتف صحيح",
                                textAlign: TextAlign.left,
                                textFieldController: phoneNumberController,
                                countries: const ['IQ'],
                                inputDecoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          const AuthTitleWidget(title: 'كلمة المرور'),
                          defaultTextField(
                              hintText: 'ادخل كلمة المرور',
                              controller: passwordController,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  provRead.changeEyeValue();
                                },
                                child: provWatch.isVisible
                                    ? const Icon(Icons.remove_red_eye_outlined)
                                    : const Icon(Icons.remove_red_eye_rounded),
                              ),
                              maxLines: 1,
                              obscureText: provWatch.isVisible,
                              validator: (s) {
                                if (s!.isEmpty) {
                                  return "لايمكن ان يكون هذا الحقل فارغا";
                                } else if (s.length <= 6 || s.length >= 20) {
                                  return "يجب ان يكون طول كلمة المرور اكبر او يساوي 6";
                                }
                              }),
                          SizedBox(
                            height: 8.h,
                          ),
                          const AuthTitleWidget(title: 'تاريخ الميلاد'),
                          defaultTextField(
                              readOnly: true,
                              hintText: 'ادخل تاريخ ميلادك',
                              controller: ageController,
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.parse('1800-05-05'),
                                  lastDate: DateTime.now(),
                                ).then((value) {
                                  if (value != null) {
                                    ageController.text =
                                        DateFormat('yyy-MM-dd').format(value);
                                    print(ageController.text);
                                  }
                                });
                              },
                              validator: (s) {
                                if (s!.isEmpty) {
                                  return "لايمكن ان يكون هذا الحقل فارغا";
                                }
                              }),
                          SizedBox(
                            height: 8.h,
                          ),
                          const AuthTitleWidget(title: 'المحافظة'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: Orientation.landscape == orientation
                                    ? 5
                                    : 3,
                                child: defaultDropDownButton(
                                    value: provWatch.initialGovernorate,
                                    items: provWatch.governorateList,
                                    onChanged: (v) {
                                      provRead.changeGovernorateValue(value: v);
                                    }),
                              ),
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: Orientation.landscape == orientation
                                        ? 50.w
                                        : 70.w,
                                    height: Orientation.landscape == orientation
                                        ? 80.h
                                        : 70.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.containerColor,
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    child: Icon(
                                      Icons.gps_fixed_rounded,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          const AuthTitleWidget(title: 'المدينة'),
                          defaultTextField(
                              hintText: 'ادخل اسم المدينة  مثلا (الكرادة)',
                              controller: cityController,
                              validator: (s) {
                                if (s!.isEmpty) {
                                  return "لايمكن ان يكون هذا الحقل فارغا";
                                } else if (s.length <= 5 || s.length >= 20) {
                                  return "لا يمكن ان يكون اسم المدينة اصغر من 5 احرف او اكبر من 20";
                                }
                              }),
                          SizedBox(
                            height: 8.h,
                          ),
                          const AuthTitleWidget(title: 'الجنس'),
                          defaultDropDownButton(
                              value: provWatch.initialGender,
                              items: provWatch.genderList,
                              onChanged: (v) {
                                provRead.changeGenderValue(value: v);
                              }),
                          SizedBox(
                            height: 20.h,
                          ),

                          //! Send Data

                          Visibility(
                            visible: provWatch.isButtonShowing,
                            replacement: const Center(
                              child: CircularProgressIndicator(),
                            ),
                            child: Center(
                                child: defaultButton(
                                    text: 'انشاء حساب',
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        provRead.signUp(
                                            context: context,
                                            body: SignUpUserModel(
                                                    avatar: context
                                                        .read<
                                                            UploadImageProvider>()
                                                        .file
                                                        ?.path,
                                                    name:
                                                        userNameController.text,
                                                    password:
                                                        passwordController.text,
                                                    phoneNumber:
                                                        phoneNumberController
                                                            .text,
                                                    city: provRead
                                                        .initialGovernorate,
                                                    town: cityController.text,
                                                    dob: DateTime.parse(
                                                        ageController.text),
                                                    gender:
                                                        provRead.initialGender,
                                                    roleName: "user")
                                                .toJson());
                                      }
                                      // force keyboard go down
                                      FocusScope.of(context).unfocus();
                                    })),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
