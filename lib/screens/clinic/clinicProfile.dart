import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/components/defaultProfileContainer.dart';
import 'package:medical_services/components/defaultProfileInfoCard.dart';
import 'package:medical_services/components/iconProfile.dart';
import 'package:medical_services/settings/colors.dart';

import 'widgets/defaultListView.dart';

class ClinicProfile extends StatefulWidget {
  const ClinicProfile({Key? key}) : super(key: key);

  @override
  State<ClinicProfile> createState() => _ClinicProfileState();
}

class _ClinicProfileState extends State<ClinicProfile> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: OrientationBuilder(
        builder: (context, orientation) => Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  defaultProfileContainer(height: 300.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                  'assets/icons/arrowBack.svg'),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                  //color of the heart must change
                                  'assets/icons/heartProfile.svg'),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 55.h,
                        child: CircleAvatar(
                          radius: 54.h,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1629909613654-28e377c37b09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        'عيادة النهرين',
                        style: TextStyle(
                            fontSize: Orientation.landscape == orientation
                                ? 20.sp
                                : 17.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      //icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconProfile(
                              imgUrl: 'assets/icons/location.svg',
                              onTap: () {}),
                          SizedBox(
                            width: 10.w,
                          ),
                          IconProfile(
                            imgUrl: 'assets/icons/time.svg',
                            onTap: () {},
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          IconProfile(
                            imgUrl: 'assets/icons/call.svg',
                            onTap: () {},
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              //about clinic
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'عن العيادة',
                      style: TextStyle(
                          fontSize: Orientation.landscape == orientation
                              ? 23.sp
                              : 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'دكتورة سميرة علي محمد , من افضل الجراحين في بغداد , حائزة على شهادات عالمية في بريطانيا و امريكا',
                      style: TextStyle(
                          fontSize: Orientation.landscape == orientation
                              ? 20.sp
                              : 15.sp,
                          color: AppColors.greyColor),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  DefaultProfileInfoCard(
                    ContainerColor: AppColors.ratingCardProfileColor,
                    title: 'التقييم',
                    rating: '4.5',
                    iconUrl: 'assets/icons/star.svg',
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  DefaultProfileInfoCard(
                    ContainerColor: AppColors.secondaryColor,
                    title: 'التخصصات',
                    rating: '10',
                    iconUrl: 'assets/icons/fluent_doctor.svg',
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  DefaultProfileInfoCard(
                    ContainerColor: AppColors.numberofDocCardColor,
                    title: 'الاطباء',
                    rating: '17',
                    iconUrl: 'assets/icons/group.svg',
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'الاطباء',
                  style: TextStyle(
                      fontSize:
                          Orientation.landscape == orientation ? 23.sp : 20.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 180.h,
                child: DefaultListView(
                  imgUrl:
                      'https://images.unsplash.com/photo-1612531386530-97286d97c2d2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTV8fGRvY3RvcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60',
                  title: 'دكتور سمير',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
