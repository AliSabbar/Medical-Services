import 'package:flutter/material.dart';
import 'package:medical_services/components/defaultToast.dart';
import 'package:medical_services/settings/routes_manger.dart';
import '../../../components/servicesItem.dart';
import '../../../settings/colors.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ServicesItem(
            assetName: 'assets/icons/test.svg',
            color: AppColors.ambColor,
            onTap: () {}),
        ServicesItem(
            assetName: 'assets/icons/hospital.svg',
            color: AppColors.hospitalColor,
            onTap: () {
              defaultToast(
                  message: "قريبا.....", color: AppColors.secondaryColor);
            }),
        ServicesItem(
            assetName: 'assets/icons/clinic.svg',
            color: AppColors.clinicColor,
            onTap: () {
              Navigator.pushNamed(context, Routes.clinics);
            }),
        ServicesItem(
            assetName: 'assets/icons/doctor.svg',
            color: AppColors.doctorColor,
            onTap: () {
              Navigator.pushNamed(context, Routes.specialtyScreen);
            }),
      ],
    );
  }
}
