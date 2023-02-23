import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/components/defaultClinicsCard.dart';
import 'package:medical_services/screens/clinic/widgets/defaultListView.dart';
import 'package:medical_services/screens/homeScreen/widgets/miss_doctor.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:medical_services/settings/routes_manger.dart';

class ClinicsScreen extends StatelessWidget {
  const ClinicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: OrientationBuilder(
        builder: (context, orientation) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'العيادات',
              //make the size bigger
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              const MissDoctor(
                title: 'العيادات الطبية',
              ),
              SizedBox(
                height: 18.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'العيادات بالقرب منك',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    GestureDetector(
                      child: Text(
                        'عرض الكل',
                        style: TextStyle(
                            color: AppColors.greyColor, fontSize: 13.sp),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.clinicsNearBy);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const DefaultListView(),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'العيادات الاعلى تقيما',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    GestureDetector(
                      child: Text(
                        'عرض الكل',
                        style: TextStyle(
                            color: AppColors.greyColor, fontSize: 13.sp),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.clinicsTopRated);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              // the first list
              const DefaultListView(),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
