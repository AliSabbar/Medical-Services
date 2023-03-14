import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medical_services/components/authTitleWidget.dart';
import 'package:medical_services/components/defaultButton.dart';
import 'package:medical_services/components/defaultDropDownButton.dart';
import 'package:medical_services/components/defaultPhoneNumber.dart';
import 'package:medical_services/components/defaultProfileContainer.dart';
import 'package:medical_services/components/defaultTextField.dart';
import 'package:medical_services/network/local/shared_helper.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:medical_services/providers/userProfile_provider.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:medical_services/settings/routes_manger.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.userProfile});
  final userProfile;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  // FORM KEY
  var formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    usernameController.dispose();
    ageController.dispose();
    townController.dispose();
    cityController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 500), () {
      context.read<UserProfileProvider>().isActive = false;
      ageController.text =
          widget.userProfile.setting.dob.toString().substring(0, 10);
      genderController.text = widget.userProfile.setting.gender;
      phoneNumberController.text = widget.userProfile.phoneNumber.substring(5);
      usernameController.text = widget.userProfile.name;
      townController.text = widget.userProfile.address.town;
      cityController.text = widget.userProfile.address.city;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provRead = context.read<UserProfileProvider>();
    var provWatch = context.watch<UserProfileProvider>();
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.secondaryColor,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.settingsScreen);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const Icon(
                  Icons.settings,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        body: provWatch.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      defaultProfileContainer(
                          height: 260,
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 70.r,
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                  // widget.userProfile.name,
                                  context.watch<AuthProvider>().userModel ==
                                          null
                                      ? "جاري التحميل"
                                      : context
                                          .watch<AuthProvider>()
                                          .userModel!
                                          .data
                                          .name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: provWatch.isActive
                                    ? MainAxisAlignment.spaceEvenly
                                    : MainAxisAlignment.center,
                                children: [
                                  provWatch.isActive
                                      ? defaultButton(
                                          text: 'الغاء',
                                          color: AppColors.greyColor,
                                          onPressed: () {
                                            provRead.inactiveField();
                                          },
                                          width: 140.w,
                                          height: 50.h,
                                          fontSize: 14.sp)
                                      : const SizedBox(),
                                  defaultButton(
                                      text: provWatch.isActive
                                          ? 'تحديث البيانات'
                                          : 'تعديل الملف الشخصي',
                                      onPressed: () async {
                                        print(widget.userProfile.id);
                                        if (provWatch.isActive) {
                                          await provRead.updateUserData(
                                            id: widget.userProfile.id,
                                            name: usernameController.text,
                                            avatar: '', //! image here
                                            dob: ageController.text,
                                            gender: provWatch.initialGender,
                                            city: provWatch.initialGovernorate,
                                            town: townController.text,
                                          );

                                          provWatch.isActive = false;
                                          context
                                              .read<AuthProvider>()
                                              .getUserDataById(
                                                  id: widget.userProfile.id);
                                        } else {
                                          provRead.activeField();
                                        }
                                      },
                                      width: 140.w,
                                      height: 50.h,
                                      fontSize: 13.sp),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AuthTitleWidget(title: 'اسمك الثلاثي'),
                            defaultTextField(
                                enabled: provWatch.isActive,
                                hintText: widget.userProfile.name,
                                controller: usernameController,
                                validator: (s) {
                                  if (s!.isEmpty) {
                                    return "لايمكن ان يكون هذا الحقل فارغا";
                                  }
                                }),
                            SizedBox(
                              height: 10.h,
                            ),
                            const AuthTitleWidget(title: 'رقم الهاتف'),
                            DefaultPhoneNumber(
                                phoneNumberController: phoneNumberController,
                                isEnabled: false),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const AuthTitleWidget(title: 'العمر'),
                                      defaultTextField(
                                          enabled: provWatch.isActive,
                                          readOnly: true,
                                          onTap: () {
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate:
                                                  DateTime.parse('1800-05-05'),
                                              lastDate: DateTime.now(),
                                            ).then((value) {
                                              if (value != null) {
                                                ageController.text =
                                                    DateFormat('yyy-MM-dd')
                                                        .format(value);
                                                print(ageController.text);
                                              }
                                            });
                                          },
                                          hintText: widget
                                              .userProfile.setting.dob
                                              .toString()
                                              .substring(0, 9),
                                          controller: ageController,
                                          validator: (s) {}),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const AuthTitleWidget(title: 'الجنس'),
                                      provWatch.isActive
                                          ? defaultDropDownButton(
                                              value: provWatch.initialGender,
                                              items: provWatch.genderList,
                                              onChanged: (v) {
                                                provRead.changeGenderValue(
                                                    value: v);
                                              })
                                          : defaultTextField(
                                              enabled: false,
                                              hintText: widget
                                                  .userProfile.setting.gender,
                                              controller: genderController,
                                              validator: (s) {}),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            const AuthTitleWidget(title: 'المحافظة'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: provWatch.isActive
                                      ? defaultDropDownButton(
                                          value: provWatch.initialGovernorate,
                                          items: provWatch.governorateList,
                                          onChanged: (v) {
                                            provRead.changeGovernorateValue(
                                                value: v);
                                          })
                                      : defaultTextField(
                                          enabled: false,
                                          hintText:
                                              widget.userProfile.address.city,
                                          controller: cityController,
                                          validator: (s) {}),
                                ),
                                Flexible(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 70.w,
                                      height: 70.h,
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
                              height: 10.h,
                            ),
                            const AuthTitleWidget(title: 'المدينة'),
                            defaultTextField(
                                enabled: provWatch.isActive,
                                hintText: widget.userProfile.address.town,
                                controller: townController,
                                validator: (s) {
                                  if (s!.isEmpty) {
                                    return "لايمكن ان يكون هذا الحقل فارغا";
                                  }
                                }),
                            SizedBox(
                              height: 10.h,
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
