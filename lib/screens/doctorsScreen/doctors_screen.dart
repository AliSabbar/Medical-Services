import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/components/defaultButton.dart';
import 'package:medical_services/components/searchWidget.dart';
import 'package:medical_services/providers/doctors_provider.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:provider/provider.dart';

import '../../components/doctorCard.dart';
import '../../components/sortWidget.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});
  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("اختيار طبيب"),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SearchWidget(controller: searchController),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    RadioListTile(
                                            title: const Text("بالقرب منك"),
                                            value: 1,
                                            groupValue: context
                                                .watch<DoctorsProvider>()
                                                .filleter,
                                            onChanged: (v) {
                                              context
                                                  .read<DoctorsProvider>()
                                                  .changeFilleterValue(value: v);
                                            }),
                                        RadioListTile(
                                            title: const Text("دكتور"),
                                            value: 2,
                                            groupValue: context
                                                .watch<DoctorsProvider>()
                                                .filleter,
                                            onChanged: (v) {
                                              context
                                                  .read<DoctorsProvider>()
                                                  .changeFilleterValue(value: v);
                                            }),
                                        RadioListTile(
                                            title: const Text("دكتورة"),
                                            value: 3,
                                            groupValue: context
                                                .watch<DoctorsProvider>()
                                                .filleter,
                                            onChanged: (v) {
                                              context
                                                  .read<DoctorsProvider>()
                                                  .changeFilleterValue(value: v);
                                            }),
                                    ],
                                  ),
                                ));
                      },
                      child: const SortWidget(
                          text: 'التصفية', icon: Icons.filter_alt_outlined),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RadioListTile(
                                            title: const Text("الاعلى تقييما"),
                                            value: 1,
                                            groupValue: context
                                                .watch<DoctorsProvider>()
                                                .sort,
                                            onChanged: (v) {
                                              context
                                                  .read<DoctorsProvider>()
                                                  .changeSortValue(value: v);
                                            }),
                                        RadioListTile(
                                            title: const Text("الاعلى سعرا"),
                                            value: 2,
                                            groupValue: context
                                                .watch<DoctorsProvider>()
                                                .sort,
                                            onChanged: (v) {
                                              context
                                                  .read<DoctorsProvider>()
                                                  .changeSortValue(value: v);
                                            }),
                                        RadioListTile(
                                            title: const Text("الاقل سعرا"),
                                            value: 3,
                                            groupValue: context
                                                .watch<DoctorsProvider>()
                                                .sort,
                                            onChanged: (v) {
                                              context
                                                  .read<DoctorsProvider>()
                                                  .changeSortValue(value: v);
                                            }),
                                      ],
                                    ),
                                  ));
                        },
                        child: const SortWidget(
                            text: 'الترتيب', icon: Icons.swap_vert)),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return const DoctorCard();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}