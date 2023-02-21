import 'package:flutter/material.dart';

import '../../../components/servicesWidget.dart';
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
            onTap: () {}),
        ServicesItem(
            assetName: 'assets/icons/clinic.svg',
            color: AppColors.clinicColor,
            onTap: () {}),
        ServicesItem(
            assetName: 'assets/icons/doctor.svg',
            color: AppColors.doctorColor,
            onTap: () {}),
      ],
    );
  }
}
