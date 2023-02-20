import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medical_services/components/constant.dart';
import 'package:medical_services/components/defaultButton.dart';
import 'package:medical_services/components/defaultDropDownButton.dart';
import 'dart:ui' as ui;
import 'package:medical_services/components/defaultTextField.dart';
import 'package:medical_services/components/titleWidget.dart';
import 'package:medical_services/components/uploadImageWidget.dart';
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                        const CustomTitleWidget(title: 'اسمك الرباعي'),
                        defaultTextField(
                            hintText: 'ادخل اسمك الرباعي',
                            controller: userNameController,
                            validator: (s) {}),
                        SizedBox(
                          height: 8.h,
                        ),
                        const CustomTitleWidget(title: 'رقم الهاتف'),
                        defaultTextField(
                            hintText: 'ادخل رقم الهاتف',
                            controller: phoneNumberController,
                            validator: (s) {}),
                        SizedBox(
                          height: 8.h,
                        ),
                        const CustomTitleWidget(title: 'كلمة المرور'),
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
                            validator: (s) {}),
                        SizedBox(
                          height: 8.h,
                        ),
                        const CustomTitleWidget(title: 'تاريخ الميلاد'),
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
                                      DateFormat.yMMMd().format(value);
                                  print(ageController.text);
                                }
                              });
                            },
                            validator: (s) {}),
                        SizedBox(
                          height: 8.h,
                        ),
                        const CustomTitleWidget(title: 'المحافظة'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex:
                                  Orientation.landscape == orientation ? 5 : 3,
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
                        const CustomTitleWidget(title: 'المدينة'),
                        defaultTextField(
                            hintText: 'ادخل اسم المدينة  مثلا (الكرادة)',
                            controller: cityController,
                            validator: (s) {}),
                        SizedBox(
                          height: 8.h,
                        ),
                        const CustomTitleWidget(title: 'الجنس'),
                        defaultDropDownButton(
                            value: provWatch.initialGender,
                            items: provWatch.genderList,
                            onChanged: (v) {
                              provRead.changeGenderValue(value: v);
                            }),
                        SizedBox(
                          height: 10.h,
                        ),

                        //! Send Data

                        Center(
                            child: defaultButton(
                                text: 'انشاء حساب',
                                onPressed: () {
                                  // force keyboard go down

                                  FocusScope.of(context).unfocus();
                                })),
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
    );
  }
}
