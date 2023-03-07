import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_services/providers/home_provider.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:medical_services/settings/routes_manger.dart';
import 'package:provider/provider.dart';

class HomeLayOut extends StatelessWidget {
  const HomeLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    var provRead = context.read<HomeProvider>();
    var provWatch = context.watch<HomeProvider>();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(72.h),
            child: AppBar(
              title: provRead.currentIndex == 0
                  ? Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'مرحبا ,\n',
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400)),
                      // ! username from api
                      TextSpan(text: "سمير احمد سمير")
                    ]))
                  : Text(provWatch.appbarTitle[provWatch.currentIndex]),
              actions: [
                GestureDetector(
                  onTap: () {
                    //! doctor service profile
                  Navigator.pushNamed(context,true?Routes.doctorProfileServiceScreen :Routes.profileScreen);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15.w, top: 12.h),
                    child: CircleAvatar(
                      radius: 25.r,
                      //! Image from API
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/home_nav.svg',
                    color: provWatch.currentIndex == 0
                        ? AppColors.primaryColor
                        : AppColors.greyColor,
                  ),
                  label: 'الرئيسية'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/calender_nav.svg',
                    color: provWatch.currentIndex == 1
                        ? AppColors.primaryColor
                        : AppColors.greyColor,
                  ),
                  label: 'حجوزاتي'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    true
                        ? 'assets/icons/add_nav.svg'
                        : 'assets/icons/heart_nav.svg',
                    color: provWatch.currentIndex == 2
                        ? AppColors.primaryColor
                        : AppColors.greyColor,
                  ),
                  label: true ? 'اضافة حجز' : 'المفضلة'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/notification_nav.svg',
                    color: provWatch.currentIndex == 3
                        ? AppColors.primaryColor
                        : AppColors.greyColor,
                  ),
                  label: 'الاشعارات'),
            ],
            currentIndex: provWatch.currentIndex,
            onTap: (index) {
              provRead.moveNavPages(index: index);
            },
          ),
          body: provWatch.screens[provWatch.currentIndex],
        ));
  }
}
