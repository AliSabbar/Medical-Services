import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../components/patientCard.dart';
import '../../../providers/booking_provider.dart';

class PatientsCard extends StatelessWidget {
  const PatientsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 112.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount:
            context.watch<BookingProvider>().currentPatientsAppointments.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return patientCard(
              patientModel: context
                  .watch<BookingProvider>()
                  .currentPatientsAppointments[index]);
        },
      ),
    );
  }
}
