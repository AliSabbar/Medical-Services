import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/searchWidget.dart';
import 'widgets/defaultExpandedListView.dart';

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
                const DefaultExpandedListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
