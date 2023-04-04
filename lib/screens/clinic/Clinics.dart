import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/screens/clinic/widgets/defaultClinicsCard.dart';
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
      EndPoints.token != null
          ? context.read<ClinicsProvider>().getClinicsNearMe()
          : null;
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
                        EndPoints.token == null
                            ? Center(
                                child: SizedBox(
                                  height: 150.h,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.lock,
                                        color: AppColors.primaryColor,
                                        size: 50,
                                      ),
                                      const Text(
                                        "سجل دخول لعرض العيادات بالقرب منك",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: 200.h,
                                child: provWatch.listClinicsNearMe.isEmpty
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          SvgPicture.asset(
                                            "assets/icons/clinic.svg",
                                            color: AppColors.primaryColor,
                                            width: 80.w,
                                          ),
                                          const Text(
                                            'لاتوجد عيادات بالقرب منك',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      )
                                    : ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: context
                                            .watch<ClinicsProvider>()
                                            .listClinicsNearMe
                                            .length,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            width: 20.w,
                                          );
                                        },
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          List itemList = context
                                              .watch<ClinicsProvider>()
                                              .listClinicsNearMe;
                                          return DefaultClinicsCard(
                                            imgUrl:
                                                'https://images.unsplash.com/photo-1629909613654-28e377c37b09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
                                            title: itemList[index].user.name,
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  Routes.clinicProfileScreen,
                                                  arguments: itemList[index]);
                                            },
                                            starCount:
                                                itemList[index].rating.toInt(),
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
                                .listClinicTopRating
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
                                  .listClinicTopRating;
                              return DefaultClinicsCard(
                                  imgUrl:
                                      'https://images.unsplash.com/photo-1629909613654-28e377c37b09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
                                  title: itemList[index].user.name,
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.clinicProfileScreen,
                                        arguments: itemList[index]);
                                  },
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
