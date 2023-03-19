import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/screens/clinic/widgets/defaultClinicsCard.dart';
import 'package:medical_services/screens/clinic/widgets/defaultListView.dart';
import 'package:medical_services/screens/homeScreen/widgets/miss_doctor.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:medical_services/settings/routes_manger.dart';
import 'package:provider/provider.dart';

import '../../providers/clinics_provider.dart';

class ClinicsScreen extends StatefulWidget {
  const ClinicsScreen({Key? key}) : super(key: key);

  @override
  State<ClinicsScreen> createState() => _ClinicsScreenState();
}

class _ClinicsScreenState extends State<ClinicsScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () {
      context.read<ClinicsProvider>().getClinicsNearMe();
      context.read<ClinicsProvider>().getClinicsTopRating();
    });
  }

  @override
  Widget build(BuildContext context) {
    var provRead = context.read<ClinicsProvider>();
    var provWatch = context.watch<ClinicsProvider>();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: OrientationBuilder(
        builder: (context, orientation) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'العيادات',
            ),
          ),
          body: provWatch.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        // 3afitc card
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
                                    color: AppColors.greyColor,
                                    fontSize: 13.sp),
                              ),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.clinicsNearBy);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //! first list clinics near me
                        SizedBox(
                          height: 200.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: context
                                .watch<ClinicsProvider>()
                                .listclinicsNearMe
                                .length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 20.w,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              List itemList = context
                                  .watch<ClinicsProvider>()
                                  .listclinicsNearMe;
                              return DefaultClinicsCard(
                                imgUrl:
                                    'https://images.unsplash.com/photo-1629909613654-28e377c37b09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
                                title: itemList[index].user.name,
                                onTap: () {},
                                starCount: itemList[index].rating.toInt(),
                              );
                            },
                          ),
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
                                    color: AppColors.greyColor,
                                    fontSize: 13.sp),
                              ),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.clinicsTopRated);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //! second list top rated clinics
                        SizedBox(
                          height: 200.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: context
                                .watch<ClinicsProvider>()
                                .listclinicTopRating
                                .length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 20.w,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              List itemList = context
                                  .watch<ClinicsProvider>()
                                  .listclinicTopRating;
                              return DefaultClinicsCard(
                                  imgUrl:
                                      'https://images.unsplash.com/photo-1629909613654-28e377c37b09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
                                  title: itemList[index].user.name,
                                  onTap: () {},
                                  starCount: itemList[index].rating.toInt());
                            },
                          ),
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
