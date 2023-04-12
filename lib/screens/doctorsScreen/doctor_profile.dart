import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medical_services/components/defaultButton.dart';
import 'package:medical_services/components/defaultProfileContainer.dart';
import 'package:medical_services/components/defaultProfileInfoCard.dart';
import 'package:medical_services/components/iconProfile.dart';
import 'package:medical_services/components/specialtyContainer.dart';
import 'package:medical_services/components/url_lunchFunction.dart';
import 'package:medical_services/network/local/shared_helper.dart';
import 'package:medical_services/providers/booking_provider.dart';
import 'package:medical_services/providers/doctor_provider.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import '../../components/timeDialog.dart';
import '../../network/end_points.dart';
import '../../settings/routes_manger.dart';

class DoctorProfile extends StatefulWidget {
  DoctorProfile({Key? key, required this.doctorModel}) : super(key: key);
  var doctorModel;

  @override
  State<DoctorProfile> createState() => DoctorProfileState();
}

class DoctorProfileState extends State<DoctorProfile> {
  bool isExpand = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      // ! GET FAV
      EndPoints.token != null
          ? context
              .read<DoctorProvider>()
              .getFav(userId: SharedHelper.getData(key: 'userId'))
          : null;
      // ! CHECK IF DOC IN FAV
      EndPoints.token != null
     ? context
          .read<DoctorProvider>()
          .checkDocInFav(doctorId: widget.doctorModel.id):
          null;

      // ! GET APPOINTMENT

      context.read<BookingProvider>().getAppointment(
          drID: widget.doctorModel.id, date: DateTime.now().toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provRead = context.read<AuthProvider>();
    var provWatch = context.watch<AuthProvider>();
    var provDocRead = context.read<DoctorProvider>();
    var provDocWatch = context.watch<DoctorProvider>();

    print(provDocRead.checkDocInFav(doctorId: widget.doctorModel.id));

    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: OrientationBuilder(
        builder: (context, orientation) => Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.secondaryColor,
              actions: [
                provRead.doctorModel != null
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () async {
                          //! here you should work
                          provDocRead.addORremoveDocFromFav(
                              doctorID: widget.doctorModel.id,
                              userID: SharedHelper.getData(key: 'userId'));
                        },
                        child: EndPoints.token == null
                            ? const SizedBox()
                            : Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: provDocWatch.isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : Icon(
                                        provDocWatch.isExist
                                            ? Icons.favorite_rounded
                                            : Icons.favorite_outline_rounded,
                                        size: 30,
                                        color: provDocWatch.isExist
                                            ? Colors.red
                                            : null,
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
                            widget.doctorModel.user.name,
                            style: Theme.of(context).textTheme.headlineMedium,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            widget.doctorModel.magerSpecialties,
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
                                onTap: () {
                                  showDialog<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Directionality(
                                        textDirection: ui.TextDirection.rtl,
                                        child: AlertDialog(
                                          // <-- SEE HERE
                                          title: Text(
                                            ' العيادة واوقات الاستشارة',
                                            style: TextStyle(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    SvgPicture.asset(
                                                        'assets/icons/time.svg'),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    Text("اوقات الاستشارة",
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                    const Spacer(),
                                                    Text(
                                                        "${widget.doctorModel.openAt} الى ${widget.doctorModel.closeAt}"),
                                                  ],
                                                ),
                                                SizedBox(height: 15.w),
                                                Row(
                                                  children: <Widget>[
                                                    SvgPicture.asset(
                                                        'assets/icons/clinic_prof.svg'),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    Text("العيادة",
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                    const Spacer(),
                                                    // ! name of clinic
                                                    Text("عيادة النهرين"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('اغلاق'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              iconProfile(
                                imgUrl: 'assets/icons/call.svg',
                                onTap: () async {
                                  UrlLunch.makeCall(
                                      phoneNumber:
                                          widget.doctorModel.user.phoneNumber);
                                },
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
                          "عن الطبيب",
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
                                    text: widget.doctorModel.user.setting.bio,
                                  ),
                                  !isExpand
                                      ? TextSpan(
                                          text: 'عرض تفاصيل اكثر',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "التخصصات الفرعية",
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
                                              "اخفاء",
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
                                          itemCount: widget
                                              .doctorModel.specialties.length,
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return SizedBox(
                                              width: 10.w,
                                            );
                                          },
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return specialtyContainer(
                                                width: 180,
                                                height: 59,
                                                circleRadius: 15,
                                                fontSize: 14,
                                                title: widget.doctorModel
                                                    .specialties[index].name,
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
                              containerColor: AppColors.ratingCardProfileColor,
                              title: 'التقييم',
                              value: widget.doctorModel.rating.toString(),
                              iconUrl: 'assets/icons/star.svg',
                            ),
                            DefaultProfileInfoCard(
                              containerColor: AppColors.secondaryColor,
                              title: 'الخبرات',
                              value: "سنة ${widget.doctorModel.xp}",
                              iconUrl: 'assets/icons/exp.svg',
                            ),
                            DefaultProfileInfoCard(
                              containerColor: AppColors.greenColor,
                              title: 'الكشفية',
                              value: '${widget.doctorModel.cost} الف',
                              iconUrl: 'assets/icons/money_prof.svg',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "الاوقات المتاحة",
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
                          child: context.watch<BookingProvider>().isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : context
                                      .read<BookingProvider>()
                                      .capsuleList
                                      .isEmpty
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.calendar_month_rounded,
                                          size: 50,
                                          color: AppColors.primaryColor,
                                        ),
                                        Text('لم يتم اضافة حجوزات بعد')
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Expanded(
                                          child: ListView.separated(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: context
                                                .read<BookingProvider>()
                                                .capsuleList
                                                .length,
                                            shrinkWrap: true,
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return SizedBox(
                                                width: 10.w,
                                              );
                                            },
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return capsuleWidget(
                                                  model: context
                                                      .read<BookingProvider>()
                                                      .capsuleModel
                                                      .data[index],
                                                  doctorModel:
                                                      widget.doctorModel);
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
                                text: 'احجز الان',
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

Widget capsuleWidget({required model, required doctorModel}) {
  return Builder(builder: (context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => ListTimeDialog(
                  drID: model.dr.id,
                  date: model.date.toString(),
                  doctorModel: doctorModel,
                )
            //! end
            );
      },
      child: Container(
        width: 75.w,
        // height: 49.h,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                // height: 35.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                  color: AppColors.greyColor,
                ),
                child: Text(
                  "${model.date.day.toString()} - ${model.date.month.toString()} - ${model.date.year.toString()} ",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "من ${context.read<BookingProvider>().convertTime(time: model.openAt)}",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greyColor),
                  ),
                  Text(
                    "الى ${context.read<BookingProvider>().convertTime(time: model.closeAt)}",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greyColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  });
}
