import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_services/components/authTitleWidget.dart';
import 'package:medical_services/components/defaultButton.dart';
import 'package:medical_services/components/defaultDropDownButton.dart';
import 'package:medical_services/components/defaultProfileContainer.dart';
import 'package:medical_services/components/defaultTextField.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:medical_services/settings/routes_manger.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    phoneNumberController.dispose();
    ageController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provRead = context.read<AuthProvider>();
    var provWatch = context.watch<AuthProvider>();
    return Directionality(
      textDirection: TextDirection.rtl,
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
                  size: 35,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              defaultProfileContainer(
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
                  Text("سمير احمد سمير",
                      style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(
                    height: 10.h,
                  ),
                  defaultButton(
                      text: 'تعديل الملف الشخصي',
                      onPressed: () {},
                      width: 140.w,
                      height: 50.h,
                      fontSize: 12),
                ],
              )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AuthTitleWidget(title: 'اسمك الرباعي'),
                    defaultTextField(
                        readOnly: true,
                        hintText: 'سمير محمد سمير',
                        controller: usernameController,
                        validator: (s) {}),
                    SizedBox(
                      height: 10.h,
                    ),
                    const AuthTitleWidget(title: 'رقم الهاتف'),
                    defaultTextField(
                        readOnly: true,
                        hintText: '07746140233',
                        controller: phoneNumberController,
                        validator: (s) {}),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              AuthTitleWidget(title: 'العمر'),
                              defaultTextField(
                                  readOnly: true,
                                  hintText: '2000 Aug 18',
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
                              AuthTitleWidget(title: 'الجنس'),
                              defaultDropDownButton(
                                  value: provWatch.initialGender,
                                  items: provWatch.genderList,
                                  onChanged: (v) {
                                    provRead.changeGenderValue(value: v);
                                  }),
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
                              width: 70.w,
                              height: 70.h,
                              decoration: BoxDecoration(
                                  color: AppColors.containerColor,
                                  borderRadius: BorderRadius.circular(20.r)),
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
                        readOnly: true,
                        hintText: 'الكرادة',
                        controller: cityController,
                        validator: (s) {}),
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
    );
  }
}
