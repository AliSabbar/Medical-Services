// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import '../../settings/colors.dart';
import '../../settings/routes_manger.dart';

class AdminPanelScreen extends StatelessWidget {
  AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("لوحة التحكم"),
            actions: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "تسجيل الخروج",
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          ),
          body: GridView.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              adminPanelItem(
                  name: "اضافة طبيب",
                  icon: "assets/icons/doctor.svg",
                  onTap: () async {
                    Navigator.pushNamed(context, Routes.addDoctorScreenRoute);
                  },
                  screen: Routes.addDoctorScreenRoute),
              adminPanelItem(
                  name: "اضافة عيادة",
                  icon: "assets/icons/clinic2_admin.svg",
                  onTap: () {
                    Navigator.pushNamed(context, Routes.addClinicScreenRoute);
                  },
                  screen: Routes.addClinicScreenRoute),
              adminPanelItem(
                  name: "اضافة تخصص",
                  icon: "assets/icons/clinic_admin.svg",
                  onTap: () {
                    Navigator.pushNamed(context, Routes.addSpecialtyScreenRoute);
                  },
                  screen: Routes.addSpecialtyScreenRoute),
              adminPanelItem(
                  name: "عرض المستخدمين",
                  icon: "assets/icons/group_admin.svg",
                  onTap: () {
                    Navigator.pushNamed(context, Routes.showUsersScreenRoute);
                  },
                  screen: Routes.showUsersScreenRoute),
              adminPanelItem(
                  name: "عرض العيادات",
                  icon: "assets/icons/clinic2_admin.svg",
                  onTap: () {
                    Navigator.pushNamed(context, Routes.showClinicScreenRoute);
                  },
                  screen: Routes.showClinicScreenRoute),
              adminPanelItem(
                  name: "عرض الاطباء",
                  icon: "assets/icons/doctor.svg",
                  onTap: () {
                    Navigator.pushNamed(context, Routes.showDoctorsScreenRoute);
                  },
                  screen: Routes.showDoctorsScreenRoute),
            ],
          )),
    );
  }

//   Widget adminPanelItem({
//     required model,
//     required context,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: InkWell(
//         onTap: () {
//           Navigator.pushNamed(context, model.screen);
//           model.onTap();
//         },
//         child: Container(
//           width: 147,
//           height: 145,
//           decoration: BoxDecoration(
//               color: AppColors.secondaryColor,
//               borderRadius: BorderRadius.circular(20)),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(model.icon),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 model.name,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.primaryColor,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

  Widget adminPanelItem({
    required String name,
    required String icon,
    required String screen,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 147,
          height: 145,
          decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              const SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
