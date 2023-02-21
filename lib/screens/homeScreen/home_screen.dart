import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_services/components/defaultTextField.dart';
import 'package:medical_services/components/authTitleWidget.dart';
import 'package:medical_services/components/searchWidget.dart';
import 'package:medical_services/components/servicesWidget.dart';
import 'package:medical_services/providers/home_provider.dart';
import 'package:medical_services/screens/homeScreen/widgets/miss_doctor.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provRead = context.read<HomeProvider>();
    var provWatch = context.watch<HomeProvider>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
// * SEARCH

                  SearchWidget(controller: searchController),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('الخدمات',
                      style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(
                    height: 20.h,
                  ),
//* SERVICES
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ServicesWidget(
                          assetName: 'assets/icons/test.svg',
                          color: AppColors.ambColor,
                          onTap: () {}),
                      ServicesWidget(
                          assetName: 'assets/icons/hospital.svg',
                          color: AppColors.hospitalColor,
                          onTap: () {}),
                      ServicesWidget(
                          assetName: 'assets/icons/clinic.svg',
                          color: AppColors.clinicColor,
                          onTap: () {}),
                      ServicesWidget(
                          assetName: 'assets/icons/doctor.svg',
                          color: AppColors.doctorColor,
                          onTap: () {}),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),

//* The Doctor  

                  const MissDoctor(),

                  SizedBox(
                    height: 30.h,
                  ),
                  Text('الحجوازات القائمة',
                      style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(
                    height: 20.h,
                  ),


// ! Appointment WORK 
                  Container(
                    width: 208.w,
                    height: 112.h,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
