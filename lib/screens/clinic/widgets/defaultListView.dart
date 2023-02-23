import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/defaultClinicsCard.dart';

class DefaultListView extends StatelessWidget {
  const DefaultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
          itemCount: 5,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          itemBuilder: (context, index) {
            return DefaultClinicsCard(
              imgUrl:
                  'https://images.unsplash.com/photo-1629909613654-28e377c37b09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
              title: ' عيادة النهرين الطبية العالمية',
              onTap: () {},
            );
            // must take the number of stars
          }),
    );
  }
}
