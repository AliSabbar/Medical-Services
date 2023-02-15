// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import '../../settings/colors.dart';
import '../../settings/routes_manger.dart';

class AdminPanelScreen extends StatelessWidget {
  AdminPanelScreen({super.key});

  List itemList = [
    AdminPanelModel(
        name: "اضافة طبيب",
        icon: "assets/icons/doctor.svg",
        onTap: () async {},
        screen: Routes.addDoctorScreenRoute),
    AdminPanelModel(
        name: "اضافة عيادة",
        icon: "assets/icons/clinic2_admin.svg",
        onTap: () {},
        screen: Routes.addClinicScreenRoute),
    AdminPanelModel(
        name: "اضافة تخصص",
        icon: "assets/icons/clinic_admin.svg",
        onTap: () {},
        screen: Routes.addSpecialtyScreenRoute),
    AdminPanelModel(
        name: "عرض المستخدمين",
        icon: "assets/icons/group_admin.svg",
        onTap: () {},
        screen: Routes.showUsersScreenRoute),
    AdminPanelModel(
        name: "عرض العيادات",
        icon: "assets/icons/clinic2_admin.svg",
        onTap: () {},
        screen: Routes.showClinicScreenRoute),
    AdminPanelModel(
        name: "عرض الاطباء",
        icon: "assets/icons/doctor.svg",
        onTap: () {},
        screen: Routes.showDoctorsScreenRoute),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int index) {
          return adminPanelItem(model: itemList[index], context: context);
        },
      ),
    );
  }

  Widget adminPanelItem({
    required model,
    required context,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, model.screen);
          model.onTap();
        },
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
              SvgPicture.asset(model.icon),
              const SizedBox(
                height: 10,
              ),
              Text(
                model.name,
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

class AdminPanelModel {
  String name;
  String icon;
  String screen;
  VoidCallback onTap;
  AdminPanelModel({
    required this.name,
    required this.icon,
    required this.onTap,
    required this.screen,
  });
}
