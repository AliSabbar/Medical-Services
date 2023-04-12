import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../settings/routes_manger.dart';
import 'widgets/defaultClinicsTile.dart';
import '../../components/searchWidget.dart';
import '../../providers/clinics_provider.dart';

class ClinicsTopRated extends StatelessWidget {
  const ClinicsTopRated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: OrientationBuilder(
        builder: (context, orientation) => Scaffold(
          appBar: AppBar(
            title: const Text('العيادات الاعلى تقييما'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                SearchWidget(controller: searchController),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: context
                        .watch<ClinicsProvider>()
                        .listClinicTopRating
                        .length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 15.h,
                    ),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      List itemList =
                          context.watch<ClinicsProvider>().listClinicTopRating;
                      return DefaultClinicsTile(
                        imgUrl:
                            'https://images.unsplash.com/photo-1629909613654-28e377c37b09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
                        title: itemList[index].user.name,
                        starCount: itemList[index].rating.toInt(),
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.clinicProfileScreen,
                              arguments: itemList[index]);
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
