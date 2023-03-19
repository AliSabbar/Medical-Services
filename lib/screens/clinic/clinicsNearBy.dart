import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/screens/clinic/widgets/defaultClinicsTile.dart';
import 'package:medical_services/components/searchWidget.dart';
import 'package:medical_services/screens/clinic/widgets/defaultExpandedListView.dart';
import '../../settings/colors.dart';

class ClinicsNearBy extends StatelessWidget {
  const ClinicsNearBy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: OrientationBuilder(
        builder: (context, orientation) => Scaffold(
          appBar: AppBar(
            title: const Text('العيادات بالقرب منك'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 10.h,
                ),
                SearchWidget(controller: searchController),
                SizedBox(
                  height: 20.h,
                ),
                const SizedBox(child: DefaultExpandedListView()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
