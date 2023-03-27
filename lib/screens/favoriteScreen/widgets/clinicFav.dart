import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/providers/clinics_provider.dart';
import 'package:medical_services/settings/routes_manger.dart';
import 'package:provider/provider.dart';

import '../../../network/local/shared_helper.dart';
import '../../clinic/widgets/defaultClinicsTile.dart';

class ClinicFav extends StatefulWidget {
  const ClinicFav({super.key});

  @override
  State<ClinicFav> createState() => _ClinicFavState();
}

class _ClinicFavState extends State<ClinicFav> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      context
          .read<ClinicsProvider>()
          .getFav(userId: SharedHelper.getData(key: 'userId'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provRead = context.read<ClinicsProvider>();
    var provWatch = context.watch<ClinicsProvider>();
    return provWatch.favClinics.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/empty_fav.svg'),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "لم يتم اضافة اي عيادة  بعد",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        : provWatch.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(15),
                itemCount: provWatch.favClinics.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 30.h,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return DefaultClinicsTile(
                    imgUrl:
                        "https://images.unsplash.com/photo-1629909613654-28e377c37b09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60",
                    onTap: () {
                      Navigator.pushNamed(context, Routes.clinicProfileScreen,arguments: provRead.favClinics[index]);
                    },
                    starCount: provWatch.favClinics[index].rating.toInt(),
                    title: provWatch.favClinics[index].user.name,
                  );
                },
              );
  }
}
