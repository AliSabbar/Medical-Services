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
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  const MissDoctor(
                    title: 'العيادات الطبية',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
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
                  SizedBox(
                    height: 10.h,
                  ),
                  DefaultListView(
                    imgUrl:
                        'https://images.unsplash.com/photo-1629909613654-28e377c37b09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
                    onTap: () {
                      Navigator.pushNamed(context, Routes.clinicProfileScreen);
                    },
                    title: 'sasasssasassasadsadعيادة النهرين',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
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
                  SizedBox(
                    height: 10.h,
                  ),
                  // the first list
                  DefaultListView(
                    imgUrl:
                        'https://images.unsplash.com/photo-1629909613654-28e377c37b09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
                    onTap: () {},
                    title: 'عيادة النهرين',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
