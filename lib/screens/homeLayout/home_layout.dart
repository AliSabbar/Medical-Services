import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_services/models/user_model.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/network/local/shared_helper.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:medical_services/providers/doctor_provider.dart';
import 'package:medical_services/providers/home_provider.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:medical_services/settings/routes_manger.dart';
import 'package:provider/provider.dart';

import '../addAppointmentScreen/add_appointment_screen.dart';
import '../appointmentScreen/appointment_screen.dart';
import '../favoriteScreen/favorite_screen.dart';
import '../guestScreen/guest_screen.dart';
import '../homeScreen/home_screen.dart';
import '../notificationsScreen/notifications_screen.dart';

class HomeLayOut extends StatefulWidget {
  const HomeLayOut({
    super.key,
  });

  @override
  State<HomeLayOut> createState() => _HomeLayOutState();
}

class _HomeLayOutState extends State<HomeLayOut> {
  @override
  void initState() {
    EndPoints.token == null
        ? () {}
        : Future.delayed(const Duration(seconds: 0), () {
            print("object");
            context
                    .read<AuthProvider>()
                    .getUserDataById(id: SharedHelper.getData(key: 'userId')) ??
                '';
          });
    super.initState();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provRead = context.read<HomeProvider>();
    var provWatch = context.watch<HomeProvider>();
    var provAuthRead = context.read<AuthProvider>();
    var provAuthWatch = context.watch<AuthProvider>();
    List appbarTitle = [
      'مرحبا ,',
      'حجوزاتي',
      EndPoints.token != null && provAuthWatch.userModel?.data.role.name == "dr"
          ? 'اضافة حجز'
          : 'المفضلة',
      'الاشعارات'
    ];

    List<Widget> screens = [
      const HomeScreen(),
      EndPoints.token == null ? const GuestScreen() : const AppointmentScreen(),
      EndPoints.token == null
          ? const GuestScreen()
          : provAuthWatch.userModel?.data.role.name == "dr"
              ? AddAppointmentScreen()
              : const FavoriteScreen(),
      EndPoints.token == null
          ? const GuestScreen()
          : const NotificationsScreen(),
    ];
    return Directionality(
        textDirection: TextDirection.rtl,
        child: provAuthWatch.isLoading
            ? const Scaffold(body: Center(child: CircularProgressIndicator()))
            : Scaffold(
                // floatingActionButton: FloatingActionButton(onPressed: () {
                //   context.read<DoctorProvider>().getFav(context);
                // }),
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(72.h),
                  child: AppBar(
                    title: currentIndex == 0
                        ? Text.rich(TextSpan(children: [
                            TextSpan(
                                text: 'مرحبا ,\n',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400)),
                            // ! username from api
                            TextSpan(
                                text: EndPoints.token == null
                                    ? "بالزائر الكريم"
                                    : provAuthWatch.userModel?.data.name,
                                style: TextStyle(fontSize: 15.sp)),
                          ]))
                        : Text(appbarTitle[currentIndex]),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          //! doctor service profile
                          Navigator.pushNamed(
                              context,
                              EndPoints.token == null
                                  ? Routes.guestScreen
                                  : provAuthWatch.userModel?.data.role.name ==
                                          "dr"
                                      ? Routes.doctorProfileServiceScreen
                                      : Routes.profileScreen,
                              arguments: provAuthWatch.userModel?.data);
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 15.w, top: 12.h),
                          child: CircleAvatar(
                            radius: 25.r,
                            //! Image from API
                            backgroundImage: EndPoints.token == null
                                ? null
                                : NetworkImage(
                                    'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
                            child: EndPoints.token == null
                                ? const Icon(Icons.person)
                                : null,
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
                          color: currentIndex == 0
                              ? AppColors.primaryColor
                              : AppColors.greyColor,
                        ),
                        label: 'الرئيسية'),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/icons/calender_nav.svg',
                          color: currentIndex == 1
                              ? AppColors.primaryColor
                              : AppColors.greyColor,
                        ),
                        label: 'حجوزاتي'),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          provAuthWatch.userModel?.data.role.name == "dr"
                              ? 'assets/icons/add_nav.svg'
                              : 'assets/icons/heart_nav.svg',
                          color: currentIndex == 2
                              ? AppColors.primaryColor
                              : AppColors.greyColor,
                        ),
                        label: provAuthWatch.userModel?.data.role.name == "dr"
                            ? "اضافة حجز"
                            : "المفضلة"),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/icons/notification_nav.svg',
                          color: currentIndex == 3
                              ? AppColors.primaryColor
                              : AppColors.greyColor,
                        ),
                        label: 'الاشعارات'),
                  ],
                  currentIndex: currentIndex,
                  onTap: (index) {
                    // provRead.moveNavPages(index: index);
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                body: screens[currentIndex],
              ));
  }
}
