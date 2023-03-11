import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_services/components/appointmentMessage.dart';

import '../../../components/appointmentCard.dart';
import '../../../components/patientCard.dart';

class AppointmentHistory extends StatelessWidget {
  const AppointmentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, right: 15.w, left: 15.w),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: 4,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 30.h,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  // ! Doctor Services
                  return appointmentCard();
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
