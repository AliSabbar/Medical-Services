import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medical_services/providers/sr_edit_profileDoctor_provider.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import '../../../../components/authTitleWidget.dart';
import '../../../../components/defaultButton.dart';
import '../../../../components/defaultChip.dart';
import '../../../../components/defaultDropDownButton.dart';
import '../../../../components/defaultTextField.dart';
import '../../../../components/uploadImageWidget.dart';
import '../../../../providers/upload_image_provider.dart';
import '../../../../settings/colors.dart';

class SrEditDoctorProfile extends StatefulWidget {
  const SrEditDoctorProfile({super.key});

  @override
  State<SrEditDoctorProfile> createState() => _SrEditDoctorProfileState();
}

class _SrEditDoctorProfileState extends State<SrEditDoctorProfile> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController timeToCloseController = TextEditingController();
  final TextEditingController timeToOpenController = TextEditingController();
  final TextEditingController expController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();
  @override
  void dispose() {
    ageController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    cityController.dispose();
    descController.dispose();
    timeToCloseController.dispose();
    timeToOpenController.dispose();
    expController.dispose();
    moneyController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<UploadImageProvider>().file = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provRead = context.read<SrEditDoctorProfileProvider>();
    var provWatch = context.watch<SrEditDoctorProfileProvider>();
    return Directionality(
        textDirection: ui.TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("تعديل الملف الشخصي"),
            ),
            body: Stepper(
              type: StepperType.horizontal,
              currentStep: provWatch.currentStep,
              onStepTapped: (newStep) {
                provRead.onStepTapped(newStep: newStep);
              },
              onStepContinue: () {
                provRead.onStepContinue();
              },
              onStepCancel: () {
                provRead.onStepCancel();
              },
              // * NEXT , BACK BUTTON
              controlsBuilder: (
                context,
                details,
              ) =>
                  Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (provWatch.currentStep != 0)
                      Flexible(
                        child: MaterialButton(
                          onPressed: () {
                            details.onStepCancel!();
                          },
                          color: Colors.grey[400],
                          textColor: Colors.black38,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Text("رجوع"),
                        ),
                      ),
                    Flexible(
                      child: MaterialButton(
                        minWidth: 200,
                        height: 40,
                        onPressed: () {
                          if (provWatch.currentStep <= 1) {
                            details.onStepContinue!();
                          } else {
                            //! here send data

                          }
                        },
                        color: AppColors.primaryColor,
                        textColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: provWatch.currentStep > 1
                            ? const Text(
                                "تحديث",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            : const Text(
                                "التالي",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              steps: [
                //! STEP ONE
                Step(
                    state: provWatch.currentStep > 0
                        ? StepState.complete
                        : StepState.indexed,
                    isActive: provWatch.currentStep == 0 ? true : false,
                    title: const Text('الحساب'),
                    content: Column(
                      children: [
                        const UploadImageWidget(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AuthTitleWidget(title: "ادخل اسمك الرباعي"),
                            defaultTextField(
                              hintText: "ادخل اسمك الرباعي ",
                              controller: usernameController,
                              validator: (s) {
                                return null;
                              },
                            ),
                            const AuthTitleWidget(title: 'رقم الهاتف'),
                            defaultTextField(
                              hintText: ' رقم الهاتف',
                              controller: phoneController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                              validator: (s) {
                                return null;
                              },
                            ),
                            const AuthTitleWidget(title: 'كلمة المرور'),
                            defaultTextField(
                              hintText: 'ادخل كلمة المرور',
                              controller: passwordController,
                              validator: (s) {
                                return null;
                              },
                            ),
                            const AuthTitleWidget(title: 'تاريخ الميلاد'),
                            defaultTextField(
                              readOnly: true,
                              hintText: 'ادخل تاريخ الميلاد',
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
                                        DateFormat.yMd().format(value);
                                  }
                                });
                              },
                              validator: (s) {
                                return null;
                              },
                            ),
                            const AuthTitleWidget(title: 'الجنس'),
                            defaultDropDownButton(
                                value: provWatch.initialValue,
                                items: provWatch.genderList,
                                onChanged: (value) {
                                  provRead.changeDropValue(
                                      value: value, changeType: "gender");
                                })
                          ],
                        ),
                      ],
                    )),
                //! STEP TWO
                Step(
                  state: provWatch.currentStep > 1
                      ? StepState.complete
                      : StepState.indexed,
                  isActive: provWatch.currentStep == 1 ? true : false,
                  title: const Text('الموقع'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AuthTitleWidget(title: 'الموقع'),
                      defaultDropDownButton(
                          value: context
                              .watch<SrEditDoctorProfileProvider>()
                              .initialGovernorate,
                          items: context
                              .watch<SrEditDoctorProfileProvider>()
                              .governorateList,
                          onChanged: (value) {
                            context
                                .read<SrEditDoctorProfileProvider>()
                                .changeDropValue(
                                    value: value, changeType: "governorate");
                          }),
                      const AuthTitleWidget(title: 'عنوان العيادة'),
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: defaultTextField(
                              hintText: 'ادخل المدينة',
                              controller: cityController,
                              validator: (s) {
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),

                          // ! current Location

                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: AppColors.containerColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Icon(
                                  Icons.gps_fixed_rounded,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                //! STEP THREE
                Step(
                  isActive: provWatch.currentStep == 2 ? true : false,
                  title: const Text('التفاصيل'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AuthTitleWidget(title: 'الوصف'),
                      defaultTextField(
                        minLines: 1,
                        maxLines: 10,
                        hintText: 'ادخل وصف عن الدكتور',
                        controller: descController,
                        validator: (s) {
                          return null;
                        },
                      ),
                      const AuthTitleWidget(title: 'التخصص الرئيسي'),
                      defaultDropDownButton(
                          value: provWatch.initialSpecialty,
                          items: provWatch.specialtyList,
                          onChanged: (value) {
                            provRead.changeDropValue(
                                value: value, changeType: "specialty");
                          }),
                      SizedBox(
                        height: 5.h,
                      ),
                      const AuthTitleWidget(title: 'التخصصات الفرعية'),
                      addSpecialty(
                          context: context,
                          value: provWatch.secondSpecialty,
                          items: provWatch.secondSpecialtyList,
                          onChanged: (value) {
                            provRead.changeDropValue(
                                value: value, changeType: "secondSpecialty");
                          }),
                      SizedBox(
                        height: 10.h,
                      ),
                      rowTextField(
                          context: context,
                          oneText: "بداية الاستشارة",
                          secondText: "نهاية الاستشارة",
                          oneController: timeToOpenController,
                          secondController: timeToCloseController,
                          oneValidator: (s) {},
                          secondValidator: (s) {},
                          onTap: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((value) {
                              timeToOpenController.text =
                                  value!.format(context).toString();
                            });
                          },
                          secondOnTap: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((value) {
                              timeToCloseController.text =
                                  value!.format(context).toString();
                            });
                          }),
                      SizedBox(
                        height: 20.h,
                      ),
                      rowTextField(
                          context: context,
                          oneText: "الخبرات",
                          secondText: "الكشفية",
                          oneController: expController,
                          secondController: moneyController,
                          oneValidator: (s) {},
                          secondValidator: (s) {}),
                    ],
                  ),
                ),
              ],
            )));
  }
}

// * add Specialty Function

Widget addSpecialty({
  required value,
  required List items,
  required onChanged,
  required context,
}) {
  double widthMQ = MediaQuery.of(context).size.width;
  double heightMQ = MediaQuery.of(context).size.height;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          defaultDropDownButton(
              width: widthMQ * 0.54,
              value: value,
              items: items,
              onChanged: onChanged),
          SizedBox(
            width: 100,
            height: 40,
            child: defaultButton(text: 'اضافة', onPressed: () {}, fontSize: 15),
          ),
        ],
      ),
      SizedBox(
        height: heightMQ * 0.01,
      ),
      Wrap(
        spacing: 8,
        children: List.generate(
            5, (index) => defaultChip(text: 'data', onDelete: () {})),
      ),
    ],
  );
}

// * row text Field

Widget rowTextField({
  required context,
  VoidCallback? onTap,
  VoidCallback? secondOnTap,
  required String oneText,
  required String secondText,
  required TextEditingController oneController,
  required TextEditingController secondController,
  required String? Function(String?) oneValidator,
  required String? Function(String?) secondValidator,
}) {
  double widthMQ = MediaQuery.of(context).size.width;
  double heightMQ = MediaQuery.of(context).size.height;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Column(
          children: [
            Text(
              oneText,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.blackColor),
            ),
            SizedBox(
              height: heightMQ * 0.01,
            ),
            defaultTextField(
              onTap: onTap,
              width: widthMQ * 0.65,
              hintText: oneText,
              controller: oneController,
              validator: oneValidator,
            ),
          ],
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Expanded(
        child: Column(
          children: [
            Text(
              secondText,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.blackColor),
            ),
            SizedBox(
              height: heightMQ * 0.01,
            ),
            defaultTextField(
              onTap: secondOnTap,
              width: widthMQ * 0.65,
              hintText: secondText,
              controller: secondController,
              validator: secondValidator,
            ),
          ],
        ),
      ),
    ],
  );
}
