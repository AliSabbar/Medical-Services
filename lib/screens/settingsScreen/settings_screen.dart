import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/components/defaultButton.dart';
import 'package:medical_services/network/local/shared_helper.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:medical_services/screens/settingsScreen/widgets/settingWidget.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الاعدادات'),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SettingsWidget(
                  title: "اللغة",
                  svgIcon: 'assets/icons/set_lang.svg',
                  backColor:const Color(0xffF2F7FF),
                  backIconColor:const Color(0xffAAC4FF),
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                SettingsWidget(
                  title: "الوان التطبيق",
                  svgIcon: 'assets/icons/set_color.svg',
                  backColor: Color(0x70D0FFE8),
                  backIconColor: Color(0xffB5F1CC),
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                SettingsWidget(
                  title: "الابلاغ عن مشكلة",
                  svgIcon: 'assets/icons/set_war.svg',
                  backColor: Color(0x29F1C2C2),
                  backIconColor: Color(0xffFD8A8A),
                  onTap: () {},
                ),
                const SizedBox(height: 25),
                defaultButton(
                    text: 'تسجيل خروج',
                    onPressed: () {
                      context.read<AuthProvider>().signOut(context: context);
                    }),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "اصدار التطبيق",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "1.0 v",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
