import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:medical_services/components/appointmentCard.dart';
import 'package:medical_services/providers/booking_provider.dart';
import 'package:medical_services/screens/appointmentScreen/widgets/appointment_history.dart';
import 'package:medical_services/screens/appointmentScreen/widgets/current_appointment.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:provider/provider.dart';

class AppointmentScreen extends StatefulWidget {
  AppointmentScreen({Key? key, required this.bookingmodel}) : super(key: key);
  var bookingmodel;

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      //!GET ALL BOOKING BY USER ID
      context
          .read<BookingProvider>()
          .getallbooking(userid: widget.bookingmodel.data.userid);
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    var provgetbookingWatch = context.watch<BookingProvider>();
    var provgetbookingRead = context.watch<BookingProvider>();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            body: Padding(
          padding:
              EdgeInsets.only(top: 15.h, right: 15.w, left: 15.w, bottom: 5.h),
          child: Column(
            children: [
              Container(
                height: 48.h,
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(25.0)),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  tabs: [
                    Text(
                      "الحجوزات الحالية",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "الحجوزات السابقة",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                  child: TabBarView(
                children: [
                  //! pass different list when api work
                  CurrentAppointment(),
                  AppointmentHistory()
                ],
              ))
            ],
          ),
        )),
      ),
    );
  }
}
