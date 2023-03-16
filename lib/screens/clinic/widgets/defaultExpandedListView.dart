import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_services/providers/clinics_provider.dart';
import 'package:provider/provider.dart';

import '../../../components/defaultClinicsTile.dart';

class DefaultExpandedListView extends StatelessWidget {
  const DefaultExpandedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: context.watch<ClinicsProvider>().listclinicsNearMe.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) => SizedBox(
          height: 15.h,
        ),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          List itemList = context.watch<ClinicsProvider>().listclinicsNearMe;
          return DefaultClinicsTile(
              imgUrl:
                  'https://images.unsplash.com/photo-1629909613654-28e377c37b09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
              title: itemList[index].user.name);
        },
      ),
    );
  }
}
