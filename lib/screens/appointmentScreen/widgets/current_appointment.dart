import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/appointmentCard.dart';
import '../../../components/appointmentMessage.dart';
import '../../../components/patientCard.dart';

class CurrentAppointment extends StatelessWidget {
  const CurrentAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
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
                    height: 20.h,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  // ! Doctor Services
                  return true ? patientCard() : appointmentCard();
                },
              ),
            ),
          ),
          const AppointmentMessage(
            text: "اضغط على الحجز لعرض ال QR CODE الخاص بالحجز ",
            width: 45,
            right: 33,
            svgPicture: 'assets/images/phone_cal.svg',
            top: 10,
          ),
        ],
      ),
    );
  }
}
