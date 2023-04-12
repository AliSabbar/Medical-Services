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
    Future.delayed(const Duration(seconds: 0), () {
      context
          .read<DoctorProvider>()
          .getFav(userId: SharedHelper.getData(key: 'userId'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provRead = context.read<DoctorProvider>();
    var provWatch = context.watch<DoctorProvider>();
    return provWatch.favDoctors.isEmpty
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
        : provWatch.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(15),
                itemCount: provWatch.favDoctors.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 30.h,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return DoctorCard(
                    doctorModel: provWatch.favDoctors[index],
                  );
                },
              );
  }
}
