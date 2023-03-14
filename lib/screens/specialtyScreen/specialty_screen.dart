import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_services/components/searchWidget.dart';
import 'package:medical_services/components/specialtyContainer.dart';
import 'package:medical_services/providers/doctor_provider.dart';
import 'package:medical_services/providers/home_provider.dart';
import 'package:medical_services/settings/routes_manger.dart';
import 'package:provider/provider.dart';

class SpecialtyScreen extends StatefulWidget {
  const SpecialtyScreen({super.key});

  @override
  State<SpecialtyScreen> createState() => _SpecialtyScreenState();
}

class _SpecialtyScreenState extends State<SpecialtyScreen> {
  TextEditingController searchController = TextEditingController();
  var scrollController = ScrollController();
  int page = 1;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () {
      context.read<HomeProvider>().specialtyList.clear();
      context.read<HomeProvider>().getAllSpecialty(page: page);
      scrollController.addListener(() async {
        if (context.read<HomeProvider>().isLoading) return;
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          if (context.read<HomeProvider>().currentPage !=
              context.read<HomeProvider>().totalPage) {
            await context.read<HomeProvider>().getAllSpecialty(page: ++page);
          }
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provRead = context.read<HomeProvider>();
    var provWatch = context.watch<HomeProvider>();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(title: const Text("اختيار تخصص")),
          body: SingleChildScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  SearchWidget(
                    controller: searchController,
                    onChange: (title) {
                      if (title.isEmpty) {
                        provRead.specialtyList.clear();
                        provRead.getAllSpecialty(page: 1);
                      } else {
                        provRead.searchSpecialty(search: title);
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: provWatch.isLoading
                          ? provWatch.specialtyList.length + 1
                          : provWatch.specialtyList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        if (index < provRead.specialtyList.length) {
                          //! pass model when api work
                          return specialtyContainer(
                              title: provWatch.specialtyList[index].name,
                              image:
                                  'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX32581005.jpg',
                              onTap: () {
                                context.read<DoctorProvider>().getAllDoctorsSP(
                                    nameSP: provWatch.specialtyList[index].name,
                                    context: context);
                              });
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
