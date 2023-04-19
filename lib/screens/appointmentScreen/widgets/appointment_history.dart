import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/components/appointmentMessage.dart';

import '../../../components/appointmentCard.dart';
import '../../../components/patientCard.dart';
import '../../../settings/colors.dart';

class AppointmentHistory extends StatelessWidget {
  const AppointmentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, right: 15.w, left: 15.w),
      child: true
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/empty_booking.svg",
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "لاتوجد حجوزات سابقة",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 4,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 20.h,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        // ! Doctor Services
                        // return appointmentCard();
                      },
                    ),
                  ),
                ),
                const AppointmentMessage(
                  text: "اضغط على الحجز لعرض ال QR CODE الخاص بالحجز ",
                  svgPicture: 'assets/images/phone_cal.svg',
                  top: 10,
                  width: 45,
                  right: 33,
                ),
              ],
            ),
    );
  }
}
