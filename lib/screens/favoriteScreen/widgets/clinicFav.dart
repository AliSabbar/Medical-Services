import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_services/components/appointmentMessage.dart';
import 'package:medical_services/components/doctorCard.dart';

import '../../../components/appointmentCard.dart';
import '../../../components/defaultClinicsTile.dart';

class ClinicFav extends StatelessWidget {
  const ClinicFav({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 30.h,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return DefaultClinicsTile(
            imgUrl:
                'https://images.unsplash.com/photo-1629909613654-28e377c37b09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
            title: 'النهرين');
      },
    );
  }
}
