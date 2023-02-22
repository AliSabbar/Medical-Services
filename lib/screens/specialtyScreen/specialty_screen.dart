import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_services/components/searchWidget.dart';
import 'package:medical_services/components/specialtyContainer.dart';
import 'package:medical_services/settings/routes_manger.dart';

class SpecialtyScreen extends StatefulWidget {
  const SpecialtyScreen({super.key});

  @override
  State<SpecialtyScreen> createState() => _SpecialtyScreenState();
}

class _SpecialtyScreenState extends State<SpecialtyScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(title: const Text("اختيار تخصص")),
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
                    height: 20.h,
                  ),
                  SizedBox(
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        //! pass model when api work
                        return specialtyContainer(
                            title: "باطنية",
                            image:
                                'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX32581005.jpg',
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.doctorsScreen);
                            });
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
