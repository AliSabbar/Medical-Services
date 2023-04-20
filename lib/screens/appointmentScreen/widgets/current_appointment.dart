import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:medical_services/providers/booking_provider.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:provider/provider.dart';

import '../../../components/appointmentCard.dart';
import '../../../components/appointmentMessage.dart';
import '../../../components/patientCard.dart';
import '../../../network/end_points.dart';
import '../../../network/local/shared_helper.dart';

class CurrentAppointment extends StatefulWidget {
  const CurrentAppointment({super.key});

  @override
  State<CurrentAppointment> createState() => _CurrentAppointmentState();
}

class _CurrentAppointmentState extends State<CurrentAppointment> {
  @override
  void initState() {
    EndPoints.token != null
        ? Future.delayed(const Duration(seconds: 0), () {
            context.read<AuthProvider>().userModel?.data.role.name == "user"
                ? context.read<BookingProvider>().getCurrentAppointments(
                    userId: SharedHelper.getData(key: 'userId'))
                : context
                    .read<BookingProvider>()
                    .getCurrentPatientsAppointments(
                        doctorId:
                            context.read<AuthProvider>().doctorModel?.data.id);
          })
        : "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provWatch = context.watch<BookingProvider>();
    var provRead = context.read<BookingProvider>();
    var provUserRead = context.read<AuthProvider>();
    var provUserWatch = context.watch<AuthProvider>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: provWatch.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount:
                          provUserWatch.userModel?.data.role.name == "user"
                              ? provWatch.currentAppointments.length
                              : provWatch.currentPatientsAppointments.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 20.h,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return provUserWatch.userModel?.data.role.name == "user"
                            ? appointmentCard(
                                appointmentModel:
                                    provWatch.currentAppointments[index],
                              )
                            : patientCard(
                                patientModel: provWatch
                                    .currentPatientsAppointments[index]);
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
