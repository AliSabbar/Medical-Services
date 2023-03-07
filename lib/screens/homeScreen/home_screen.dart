import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_services/components/searchWidget.dart';
import 'package:medical_services/providers/home_provider.dart';
import 'package:medical_services/screens/homeScreen/widgets/miss_doctor.dart';
import 'package:medical_services/screens/homeScreen/widgets/services_widget.dart';
import 'package:provider/provider.dart';

import '../../components/appointmentCard.dart';
import '../../components/patientCard.dart';

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
  Widget build(BuildContext context) {
    var provRead = context.read<HomeProvider>();
    var provWatch = context.watch<HomeProvider>();
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

                  const MissDoctor(title: 'الخدمات الطبية',),

                  SizedBox(
                    height: 30.h,
                  ),
                  Text('الحجوازات القائمة',
                      style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(
                    height: 20.h,
                  ),

// * Appointment card

                  SizedBox(
                    width: double.infinity,
                    height: 112.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 5,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 20,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        //! doctor service  
                        return true? patientCard()  :appointmentCard();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
