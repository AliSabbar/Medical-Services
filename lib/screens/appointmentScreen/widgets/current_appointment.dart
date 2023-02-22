import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/appointmentCard.dart';
import '../../../components/appointmentMessage.dart';

class CurrentAppointment extends StatelessWidget {
  const CurrentAppointment({super.key});

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
                  return appointmentCard();
                },
              ),
            ),
          ),
          const AppointmentMessage(),
        ],
      ),
    );
  }
}
