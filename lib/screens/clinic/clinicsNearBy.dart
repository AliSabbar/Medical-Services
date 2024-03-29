import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/network/end_points.dart';
import 'package:medical_services/screens/clinic/widgets/defaultClinicsTile.dart';
import 'package:medical_services/components/searchWidget.dart';
import 'package:medical_services/screens/guestScreen/guest_screen.dart';
import 'package:medical_services/settings/routes_manger.dart';
import 'package:provider/provider.dart';
import '../../providers/clinics_provider.dart';
import '../../settings/colors.dart';

class ClinicsNearBy extends StatelessWidget {
  const ClinicsNearBy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    var provWatch = context.watch<ClinicsProvider>();
    var provRead = context.read<ClinicsProvider>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: OrientationBuilder(
        builder: (context, orientation) => Scaffold(
          appBar: AppBar(
            title: const Text('العيادات بالقرب منك'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: EndPoints.token == null
                ? const GuestScreen()
                : ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      SearchWidget(controller: searchController),
                      SizedBox(
                        height: 20.h,
                      ),
                      provWatch.listClinicsNearMe.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  "assets/icons/clinic.svg",
                                  color: AppColors.primaryColor,
                                  width: 100.w,
                                ),
                                const Text(
                                  'لاتوجد عيادات بالقرب منك',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          : ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: provWatch.listClinicsNearMe.length,
                              shrinkWrap: true,
                              separatorBuilder: (context, index) => SizedBox(
                                height: 15.h,
                              ),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                List itemList = context
                                    .watch<ClinicsProvider>()
                                    .listClinicsNearMe;
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
                            )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
