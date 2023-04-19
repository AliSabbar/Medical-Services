import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import 'package:medical_services/providers/booking_provider.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../settings/colors.dart';

Widget appointmentCard({
  required appointmentModel,
}) {
  return Builder(builder: (context) {
    String day = DateFormat('EEEE').format(appointmentModel.date);
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 319.w,
                    height: 319.h,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.containerColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: QrImage(
                      data: appointmentModel.qrCode,
                      version: QrVersions.auto,
                      size: 300.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        // width: 208.w,
        height: 112.h,
        padding: EdgeInsets.only(right: 6.w, top: 6.h, bottom: 6.h, left: 20.w),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 70.w,
              height: 97.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${appointmentModel.date.month.toString()} - ${appointmentModel.date.day.toString()}",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    day,
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context
                      .read<BookingProvider>()
                      .convertTime(time: appointmentModel.time),
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor),
                  textDirection: ui.TextDirection.ltr,
                ),
                Text(
                  appointmentModel.dr.user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'عرض التفاصيل',
                  style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.greyColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  });
}
