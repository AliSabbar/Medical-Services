import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_services/providers/booking_provider.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:medical_services/settings/routes_manger.dart';
import 'package:provider/provider.dart';

import '../models/inside_capsule_model.dart';

class ListTimeDialog extends StatefulWidget {
  const ListTimeDialog({Key? key, this.drID, this.date, this.doctorModel})
      : super(key: key);

  final date;
  final doctorModel;
  final drID; // we will delete this latter and use doctorModel.id

  @override
  State<ListTimeDialog> createState() => _ListTimeDialogState();
}

class _ListTimeDialogState extends State<ListTimeDialog> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      context.read<BookingProvider>().getInsideAllCapsule(
          drID: widget.drID.toString(), date: widget.date.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provRead = context.read<BookingProvider>();
    var provWatch = context.watch<BookingProvider>();
    String date = widget.date.split(" ").first;

    print("DATE = ${widget.date}");
    print("DOC ID = ${widget.drID}");
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'اختر الوقت',
              style: TextStyle(color: AppColors.primaryColor, fontSize: 18.sp),
            ),
            Text(
              date,
              style: TextStyle(color: AppColors.greyColor, fontSize: 18.sp),
            ),
          ],
        ),
        content: provWatch.isLoadingInCap
            ? SizedBox(
                width: double.maxFinite,
                height: 300.h,
                child: const Center(child: CircularProgressIndicator()))
            : SizedBox(
                width: double.maxFinite,
                height: 300.h,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                  ),
                  itemCount: provWatch.timeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.confirmAppointmentScreen,
                              arguments: {
                                'date': date,
                                "drModel": widget.doctorModel,
                                "time": provRead.convertTime(
                              time: provWatch.timeList[index].time.toString(),
                            )
                              });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              // ! color if appointment available or not
                              color:
                                  true ? AppColors.secondaryColor : Colors.red,
                              borderRadius: BorderRadius.circular(12.r)),
                          child: Text(
                            provRead.convertTime(
                              time: provWatch.timeList[index].time.toString(),
                            ),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: <Widget>[
          TextButton(
            child: const Text(
              'اغلاق',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child:
                Text('موافق', style: TextStyle(color: AppColors.primaryColor)),
            onPressed: () {
              Navigator.pushNamed(context, Routes.confirmAppointmentScreen);
            },
          ),
        ],
      ),
    );
  }
}
