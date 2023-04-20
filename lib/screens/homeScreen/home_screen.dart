import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/components/searchWidget.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:medical_services/providers/booking_provider.dart';
import 'package:medical_services/providers/home_provider.dart';
import 'package:medical_services/screens/homeScreen/widgets/miss_doctor.dart';
import 'package:medical_services/screens/homeScreen/widgets/patientsCard.dart';
import 'package:medical_services/screens/homeScreen/widgets/services_widget.dart';
import 'package:medical_services/screens/homeScreen/widgets/userAppointments.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:provider/provider.dart';

import '../../components/appointmentCard.dart';
import '../../components/noAppointment.dart';
import '../../components/patientCard.dart';
import '../../network/local/shared_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    EndPoints.token == null
        ? () {}
        : Future.delayed(const Duration(seconds: 0), () {
            context
                    .read<AuthProvider>()
                    .getUserDataById(id: SharedHelper.getData(key: 'userId')) ??
                '';
            // print(
            //     "Doctor ID = ${context.read<AuthProvider>().doctorModel?.data.id}");
            context.read<AuthProvider>().userModel!.data.role.name == "user"
                ? context.read<BookingProvider>().getCurrentAppointments(
                    userId: SharedHelper.getData(key: 'userId'))
                : context
                    .read<BookingProvider>()
                    .getCurrentPatientsAppointments(
                        doctorId:
                            context.read<AuthProvider>().doctorModel?.data.id);

            // : print("helloppsaopspdadskdadkpasdokasdopasdapsdakasko");
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provRead = context.read<HomeProvider>();
    var provWatch = context.watch<HomeProvider>();
    var provBookingWatch = context.watch<BookingProvider>();
    var provBookingRead = context.read<BookingProvider>();
    var provAuth = context.watch<AuthProvider>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
// * SEARCH

                  SearchWidget(controller: searchController),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('الخدمات',
                      style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(
                    height: 20.h,
                  ),
//* SERVICES
                  const ServicesWidget(),

                  SizedBox(
                    height: 30.h,
                  ),

//* The Doctor

                  const MissDoctor(
                    title: 'الخدمات الطبية',
                  ),

                  SizedBox(
                    height: 30.h,
                  ),
                  Text('الحجوازات القائمة',
                      style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(
                    height: 20.h,
                  ),

// * Appointment card

                  EndPoints.token == null
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lock,
                                color: AppColors.primaryColor,
                                size: 50,
                              ),
                              const Text(
                                "سجل دخول لعرض الحجوزات الحالية",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),

  // ! USER APPOINTMENTS

                  provAuth.userModel?.data.role.name == "user"
                      ? provBookingWatch.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : provBookingWatch.currentAppointments.isEmpty
                              ? const NoAppointments()
                              : const AppointmentCard()
                      : const SizedBox(),

  // ! DOCTOR PATIENTS

                  provAuth.userModel?.data.role.name == "dr"
                      ? provBookingWatch.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : provBookingWatch.currentPatientsAppointments.isEmpty
                              ? const NoAppointments()
                              : const PatientsCard()
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
