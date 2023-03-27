import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/components/defaultProfileContainer.dart';
import 'package:medical_services/components/defaultProfileInfoCard.dart';
import 'package:medical_services/components/iconProfile.dart';
import 'package:medical_services/components/specialtyContainer.dart';
import 'package:medical_services/components/url_lunchFunction.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:medical_services/providers/clinics_provider.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:provider/provider.dart';

import '../../network/local/shared_helper.dart';
import '../../settings/routes_manger.dart';

class ClinicProfileScreen extends StatefulWidget {
  ClinicProfileScreen({Key? key, required this.clinicModel}) : super(key: key);

  var clinicModel;

  @override
  State<ClinicProfileScreen> createState() => _ClinicProfileScreenState();
}

class _ClinicProfileScreenState extends State<ClinicProfileScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      // ! GET FAV
      context
          .read<ClinicsProvider>()
          .getFav(userId: SharedHelper.getData(key: 'userId'));
      // ! CHECK IF CLINIC IN FAV
      context
          .read<ClinicsProvider>()
          .checkClinicInFav(clinicId: widget.clinicModel.id);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provRead = context.read<ClinicsProvider>();
    var provWatch = context.watch<ClinicsProvider>();
    print(provRead.checkClinicInFav(clinicId: widget.clinicModel.id));
    return Directionality(
      textDirection: TextDirection.rtl,
      child: OrientationBuilder(
        builder: (context, orientation) => Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.secondaryColor,
              actions: [
                context.read<AuthProvider>().doctorModel != null
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          // ! here tap
                          provRead.addORremoveClinicFromFav(
                              clinicID: widget.clinicModel.id,
                              userID: SharedHelper.getData(key: 'userId'));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: provWatch.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : Icon(
                                  provWatch.isExist
                                      ? Icons.favorite_rounded
                                      : Icons.favorite_outline_rounded,
                                  size: 30,
                                  color: provWatch.isExist ? Colors.red : null,
                                ),
                        ),
                      ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  defaultProfileContainer(
                      height: 260,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 70.r,
                            backgroundImage: NetworkImage(
                                "https://www.mayoclinic.org/-/media/kcms/gbs/patient-consumer/images/2018/04/23/16/35/healthsystem2x.jpg"),
                          ),
                          SizedBox(
                            height: 11.h,
                          ),
                          Text(
                            widget.clinicModel.user.name,
                            style: Theme.of(context).textTheme.headlineMedium,
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
                                imgUrl: 'assets/icons/time.svg',
                                onTap: () {},
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              iconProfile(
                                imgUrl: 'assets/icons/call.svg',
                                onTap: () {
                                  UrlLunch.makeCall(
                                      phoneNumber:
                                          widget.clinicModel.user.phoneNumber);
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
                          "عن العيادة",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Text(
                          widget.clinicModel.description,
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 14.sp,
                          ),
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
                              value: widget.clinicModel.rating.toString(),
                              iconUrl: 'assets/icons/star.svg',
                            ),
                            DefaultProfileInfoCard(
                              containerColor: AppColors.secondaryColor,
                              title: 'التخصصات',
                              value: widget.clinicModel.specialtiesNumbers
                                  .toString(),
                              iconUrl: 'assets/icons/fluent_doctor.svg',
                            ),
                            DefaultProfileInfoCard(
                              containerColor: AppColors.numberofDocCardColor,
                              title: 'الاطباء',
                              value: widget.clinicModel.drNumbers.toString(),
                              iconUrl: 'assets/icons/group.svg',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "الاطباء",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        widget.clinicModel.dr.isEmpty
                            ? const EmptyDocAndClinic(
                                name: 'لايوجد اطباء بعد',
                                svgUrl: 'assets/icons/group.svg',
                              )
                            : SizedBox(
                                height: 180.h,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: widget.clinicModel.dr.length,
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                    itemBuilder: (context, index) {
                                      return doctorsCard(
                                        context: context,
                                        doctorModel:
                                            widget.clinicModel.dr[index],
                                      );
                                    }),
                              ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "التخصصات المتوفرة",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        widget.clinicModel.specialties.isEmpty
                            ? const EmptyDocAndClinic(
                                name: 'لاتوجد تخصصات بعد',
                                svgUrl: "assets/icons/clinic.svg",
                              )
                            : SizedBox(
                                height: 59.h,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      widget.clinicModel.specialties.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width: 20.w,
                                    );
                                  },
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return specialtyContainer(
                                        width: 180,
                                        height: 59,
                                        circleRadius: 15,
                                        fontSize: 14,
                                        title: widget.clinicModel
                                            .specialties[index].name,
                                        image:
                                            'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX32581005.jpg',
                                        onTap: () {});
                                  },
                                ),
                              ),
                        SizedBox(
                          height: 10.h,
                        )
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

class EmptyDocAndClinic extends StatelessWidget {
  const EmptyDocAndClinic({
    super.key,
    required this.name,
    required this.svgUrl,
  });

  final String name;
  final String svgUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            svgUrl,
            width: 40.w,
            color: AppColors.primaryColor,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
          )
        ],
      ),
    );
  }
}

Widget doctorsCard({required doctorModel, required context}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, Routes.doctorProfileScreen,
          arguments: doctorModel);
    },
    child: Container(
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
              doctorModel.user.name.toString(),
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
              doctorModel.magerSpecialties.toString(),
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
    ),
  );
}
