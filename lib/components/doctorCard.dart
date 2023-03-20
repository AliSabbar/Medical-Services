import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_services/components/defaultButton.dart';
import 'package:medical_services/settings/routes_manger.dart';

import '../settings/colors.dart';

class DoctorCard extends StatelessWidget {
  DoctorCard({
    super.key,
    required this.doctorModel,
  });
  var doctorModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.doctorProfileScreen,
            arguments: doctorModel);
      },
      child: Container(
        width: 333.w,
        height: 180.h,
        decoration: BoxDecoration(
            color: AppColors.backgroundCardColor,
            borderRadius: BorderRadius.circular(20.r)),
        child: Row(
          children: [
            Container(
              width: 85.w,
              height: 180.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZG9jdG9yfGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
                    fit: BoxFit.cover,
                  )),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorModel.user.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(doctorModel.magerSpecialties,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 11.h,
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 3);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Icon(
                            Icons.star,
                            color: AppColors.yellowColor,
                            size: 11,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: AppColors.primaryColor,
                        ),
                        Text(
                            '${doctorModel.user.address.city} - ${doctorModel.user.address.town}',
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600))
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.attach_money_rounded,
                          color: AppColors.primaryColor,
                        ),
                        Text('الفحص ${doctorModel.cost} الف',
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // const Spacer(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60.w,
                      height: 35.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: doctorModel.isAvailable
                            ? AppColors.greenColor
                            : Colors.red,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(doctorModel.isAvailable ? "متاح" : "غير متاح",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    const Spacer(),
                    defaultButton(
                        text: 'احجز الان',
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Routes.doctorProfileScreen,
                              arguments: doctorModel);
                        },
                        width: 70,
                        height: 40,
                        fontSize: 14)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
