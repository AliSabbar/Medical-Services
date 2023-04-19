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
    Future.delayed(const Duration(seconds: 0), () {
      EndPoints.token == null
          ? ""
          : context.read<BookingProvider>().getCurrentAppointments(
              userId: SharedHelper.getData(key: 'userId'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provWatch = context.watch<BookingProvider>();
    var provRead = context.read<BookingProvider>();
    var provUserRead = context.read<AuthProvider>();
    var provUserWatch = context.watch<AuthProvider>();

    return provWatch.currentAppointments.isEmpty
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
                "لم تقم بالحجز عند اي دكتور بعد",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        : Padding(
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
                                provUserWatch.userModel?.data.role.name ==
                                        "user"
                                    ? provWatch.currentAppointments.length
                                    : 0,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 20.h,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              // ! Doctor Services
                              return provUserWatch.userModel?.data.role.name ==
                                      "user"
                                  ? appointmentCard(
                                      appointmentModel:
                                          provWatch.currentAppointments[index],
                                    )
                                  : patientCard();
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
