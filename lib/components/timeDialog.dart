import 'package:flutter/material.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:medical_services/settings/routes_manger.dart';

import '../models/inside_capsule_model.dart';

class ListTimeDialog extends StatelessWidget {
  final List timeList;

  const ListTimeDialog({Key? key, required this.timeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'اختر الوقت',
        style: TextStyle(color: AppColors.primaryColor, fontSize: 20),
        textDirection: TextDirection.rtl,
      ),
      content: Container(
        decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: timeList.length,
          itemBuilder: (BuildContext context, int index) {
            final time = timeList[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(time.toString()),
                Divider(),
              ],
            );
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('موافق', style: TextStyle(color: AppColors.primaryColor)),
          onPressed: () {
            Navigator.pushNamed(context, Routes.confirmAppointmentScreen);
          },
        ),
        TextButton(
          child: Text(
            'غلق',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
