import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_services/components/appointmentMessage.dart';
import 'package:medical_services/components/doctorCard.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../../components/appointmentCard.dart';

class DoctorFavorites extends StatelessWidget {
  const DoctorFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(15),
      itemCount: context.watch<AuthProvider>().userModel?.data.favoritedr.length??0,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 30.h,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        //! pass doctor model
        // return  DoctorCard(doctorModel: context.watch<AuthProvider>().userModel!.data.favoritedr[index],);
      },
    );
  }
}
