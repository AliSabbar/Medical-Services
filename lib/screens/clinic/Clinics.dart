import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/components/defaultClinicsCard.dart';
import 'package:medical_services/screens/clinic/widgets/defaultListView.dart';
import 'package:medical_services/screens/homeScreen/widgets/miss_doctor.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:medical_services/settings/routes_manger.dart';

class Clinics extends StatelessWidget {
  const Clinics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: OrientationBuilder(
        builder: (context, orientation) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'العـيـادات',
              //make the size bigger
            ),
          ),
          body: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const MissDoctor(
                  title: 'العيادات الطبية',
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'العيادات بالقرب منك',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: Text(
                            'عرض الكل',
                            style: TextStyle(color: AppColors.greyColor),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, Routes.ClinicsNearBy);
                          },
                        ),
                        const SizedBox(
                          width: 15,
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const DefaultListView(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'العيادات الاعلى تقييما',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: Text(
                            'عرض الكل',
                            style: TextStyle(color: AppColors.greyColor),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.ClinicsTopRated);
                          },
                        ),
                        const SizedBox(
                          width: 15,
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // the first list
                const DefaultListView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
