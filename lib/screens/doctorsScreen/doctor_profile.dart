import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/components/defaultButton.dart';
import 'package:medical_services/components/defaultProfileContainer.dart';
import 'package:medical_services/components/defaultProfileInfoCard.dart';
import 'package:medical_services/components/iconProfile.dart';
import 'package:medical_services/components/specialtyContainer.dart';
import 'package:medical_services/settings/colors.dart';

import '../../settings/routes_manger.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  @override
  State<DoctorProfile> createState() => DoctorProfileState();
}

class DoctorProfileState extends State<DoctorProfile> {
  bool isExpand = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: OrientationBuilder(
        builder: (context, orientation) => Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.secondaryColor,
              actions: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const Icon(
                      Icons.favorite_outline_rounded,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  defaultProfileContainer(
                      height: 280,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 70.r,
                            backgroundImage: NetworkImage(
                                "https://img.freepik.com/free-photo/female-doctor-lab-coat-white-isolated-confident-smile_343596-6556.jpg"),
                          ),
                          SizedBox(
                            height: 11.h,
                          ),
                          Text(
                            "???????????? ?????????? ?????? ????????",
                            style: Theme.of(context).textTheme.headlineMedium,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "?????????? ??????????",
                            style: TextStyle(fontSize: 13.sp),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              iconProfile(
                                  imgUrl: 'assets/icons/location.svg',
                                  onTap: () {}),
                              SizedBox(
                                width: 10.w,
                              ),
                              iconProfile(
                                imgUrl: 'assets/icons/clinic_prof.svg',
                                onTap: () {},
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              iconProfile(
                                imgUrl: 'assets/icons/call.svg',
                                onTap: () {},
                              )
                            ],
                          ),
                        ],
                      )),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "???? ????????????",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        //! CHANGE THIS CUZ I CAN DO BETTER
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: AppColors.greyColor,
                                    fontSize: 14.sp,
                                    fontFamily: 'Cairo'),
                                children: [
                                  TextSpan(
                                    text:
                                        '???????????? ?????????? ?????? ???????? , ???? ???????? ???????????????? ???? ?????????? ,?????????? ?????? ???????????? ???????????? ???? ???????????????? ?? ????????????',
                                  ),
                                  !isExpand
                                      ? TextSpan(
                                          text: '?????? ???????????? ????????',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: AppColors.primaryColor),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              setState(() {
                                                isExpand = !isExpand;
                                              });
                                            })
                                      : const TextSpan(),
                                ],
                              ),
                            ),
                            isExpand
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "???????????????? ??????????????",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isExpand = false;
                                              });
                                            },
                                            child: Text(
                                              "??????????",
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 7.h,
                                      ),
                                      SizedBox(
                                        height: 59.h,
                                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: 5,
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return SizedBox(
                                              width: 20.w,
                                            );
                                          },
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return specialtyContainer(
                                                width: 180,
                                                height: 59,
                                                circleRadius: 15,
                                                fontSize: 14,
                                                title: "?????? ???????? ????????????",
                                                image:
                                                    'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX32581005.jpg',
                                                onTap: () {});
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultProfileInfoCard(
                              ContainerColor: AppColors.ratingCardProfileColor,
                              title: '??????????????',
                              rating: '4.5',
                              iconUrl: 'assets/icons/star.svg',
                            ),
                            DefaultProfileInfoCard(
                              ContainerColor: AppColors.secondaryColor,
                              title: '??????????????',
                              rating: '+10 ??????',
                              iconUrl: 'assets/icons/exp.svg',
                            ),
                            DefaultProfileInfoCard(
                              ContainerColor: AppColors.greenColor,
                              title: '??????????????',
                              rating: '25 ??????',
                              iconUrl: 'assets/icons/money_prof.svg',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "?????????????? ??????????????",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        //? Pich Time
                        Container(
                          width: double.infinity,
                          height: 130.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: const Color(0xffF2F7FF),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      width: 20,
                                    );
                                  },
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      width: 70.w,
                                      // height: 49.h,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: double.infinity,
                                            height: 35.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.r),
                                                topRight: Radius.circular(20.r),
                                              ),
                                              color: AppColors.greyColor,
                                            ),
                                            child: Text(
                                              "2-12",
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "???? 8:00",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.greyColor),
                                          ),
                                          Text(
                                            "?????? 12:30",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.greyColor),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                            child: defaultButton(
                                text: '???????? ????????',
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.confirmAppointmentScreen);
                                })),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class DoctorsCard extends StatelessWidget {
  const DoctorsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155.w,
      height: 180.h,
      decoration: BoxDecoration(
        color: AppColors.backgroundCardColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "?????????? ???????? ?????? ????????",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.sp,
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              "??????????",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                overflow: TextOverflow.ellipsis,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
