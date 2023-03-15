import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/components/appointmentMessage.dart';
import 'package:medical_services/components/doctorCard.dart';
import 'package:medical_services/network/local/shared_helper.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:medical_services/providers/doctor_provider.dart';
import 'package:provider/provider.dart';

import '../../../components/appointmentCard.dart';
import '../../../models/list_doctor_model.dart';

class DoctorFavorites extends StatefulWidget {
  const DoctorFavorites({super.key});

  @override
  State<DoctorFavorites> createState() => _DoctorFavoritesState();
}

class _DoctorFavoritesState extends State<DoctorFavorites> {
  @override
  void initState() {
    context.read<DoctorProvider>().getFav(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return context.watch<DoctorProvider>().favDoctors.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/empty_fav.svg'),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "لم يتم اضافة اي دكتور  بعد",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(15),
            itemCount: context.watch<DoctorProvider>().favDoctors.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 30.h,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              //! pass doctor model
              return DoctorCard(
                doctorModel: context.watch<DoctorProvider>().favDoctors[index],
              );
            },
          );
  }
}
