import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/components/defaultButton.dart';
import 'package:medical_services/components/searchWidget.dart';
import 'package:medical_services/providers/doctor_provider.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:provider/provider.dart';
import '../../components/doctorCard.dart';
import '../../components/sortWidget.dart';

class DoctorsScreen extends StatefulWidget {
  DoctorsScreen({super.key, this.specialtyName});
  var specialtyName;
  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      var prov = context.read<DoctorProvider>();
      prov.sort = null;
      prov.filleter = null;
      prov.getAllDoctorsSP(nameSP: widget.specialtyName, context: context);
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provWatch = context.watch<DoctorProvider>();
    var provRead = context.read<DoctorProvider>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: provWatch.isLoading
          ? Scaffold(
              appBar: AppBar(
                title: const Text("اختيار طبيب"),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                title: const Text("اختيار طبيب"),
              ),
              floatingActionButton:
                  provWatch.sort == null && provWatch.filleter == null
                      ? null
                      : FloatingActionButton(
                          onPressed: () async {
                            await provRead.getAllDoctorsSP(
                              nameSP: widget.specialtyName,
                              context: context,
                            );
                            provRead.filleter = null;
                            provRead.sort = null;
                          },
                          child: const Icon(Icons.replay_rounded),
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
                      // ! SEARCH
                      SearchWidget(
                        controller: searchController,
                        onChange: (name) {
                          if (name.isEmpty) {
                            provRead.doctorsListSP.clear();
                            provRead.getAllDoctorsSP(
                                nameSP: widget.specialtyName, context: context);
                          } else {
                            provRead.searchDoctor(search: name);
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              //! FILLETER

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
                                                title: const Text("بالقرب منك"),
                                                value: 1,
                                                groupValue: context
                                                    .watch<DoctorProvider>()
                                                    .filleter,
                                                onChanged: (v) {
                                                  context
                                                      .read<DoctorProvider>()
                                                      .changeFilleterValue(
                                                          value: v,
                                                          specialtyName: widget
                                                              .specialtyName,
                                                          context: context);
                                                }),
                                            RadioListTile(
                                                title: const Text("دكتور"),
                                                value: 2,
                                                groupValue: context
                                                    .watch<DoctorProvider>()
                                                    .filleter,
                                                onChanged: (v) {
                                                  context
                                                      .read<DoctorProvider>()
                                                      .changeFilleterValue(
                                                          value: v,
                                                          specialtyName: widget
                                                              .specialtyName,
                                                          context: context);
                                                }),
                                            RadioListTile(
                                                title: const Text("دكتورة"),
                                                value: 3,
                                                groupValue: context
                                                    .watch<DoctorProvider>()
                                                    .filleter,
                                                onChanged: (v) {
                                                  context
                                                      .read<DoctorProvider>()
                                                      .changeFilleterValue(
                                                          value: v,
                                                          specialtyName: widget
                                                              .specialtyName,
                                                          context: context);
                                                }),
                                          ],
                                        ),
                                      ));
                            },
                            child: const SortWidget(
                                text: 'التصفية',
                                icon: Icons.filter_alt_outlined),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          GestureDetector(
                              onTap: () {
                                // ! SORT
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
                                                  title: const Text(
                                                      "الاعلى تقييما"),
                                                  value: 1,
                                                  groupValue: context
                                                      .watch<DoctorProvider>()
                                                      .sort,
                                                  onChanged: (v) {
                                                    context
                                                        .read<DoctorProvider>()
                                                        .changeSortValue(
                                                            value: v,
                                                            specialtyName: widget
                                                                .specialtyName,
                                                            context: context);
                                                  }),
                                              RadioListTile(
                                                  title:
                                                      const Text("الاعلى سعرا"),
                                                  value: 2,
                                                  groupValue: context
                                                      .watch<DoctorProvider>()
                                                      .sort,
                                                  onChanged: (v) {
                                                    context
                                                        .read<DoctorProvider>()
                                                        .changeSortValue(
                                                            value: v,
                                                            specialtyName: widget
                                                                .specialtyName,
                                                            context: context);
                                                  }),
                                              RadioListTile(
                                                  title:
                                                      const Text("الاقل سعرا"),
                                                  value: 3,
                                                  groupValue: context
                                                      .watch<DoctorProvider>()
                                                      .sort,
                                                  onChanged: (v) {
                                                    context
                                                        .read<DoctorProvider>()
                                                        .changeSortValue(
                                                            value: v,
                                                            specialtyName: widget
                                                                .specialtyName,
                                                            context: context);
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
                          itemCount: provWatch.doctorsListSP.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return DoctorCard(
                              doctorModel: provWatch.doctorsListSP[index],
                            );
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
