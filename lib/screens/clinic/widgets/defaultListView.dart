import 'package:flutter/material.dart';

import '../../../components/defaultClinicsCard.dart';

class DefaultListView extends StatelessWidget {
  const DefaultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 29),
      child: SizedBox(
        width: 400,
        height: 178,
        child: ListView.separated(
            itemCount: 2,
            separatorBuilder: (context, index) => const SizedBox(
                  width: 28,
                ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return DefaultClinicsCard(
                ImgUrl:
                    'https://images.unsplash.com/photo-1629909613654-28e377c37b09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
                title: 'النهرين',
                onTap: () {},
              );
              // must take the number of stars
            }),
      ),
    );
  }
}
