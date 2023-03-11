import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medical_services/components/appointmentMessage.dart';
import 'package:medical_services/components/defaultButton.dart';
import 'package:medical_services/components/defaultDropDownButton.dart';
import 'dart:ui' as ui;
import '../../components/authTitleWidget.dart';
import '../../components/defaultTextField.dart';

class AddAppointmentScreen extends StatefulWidget {
  const AddAppointmentScreen({super.key});

  @override
  State<AddAppointmentScreen> createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController startAppointmentController = TextEditingController();
  TextEditingController endAppointmentController = TextEditingController();
  @override
  void dispose() {
    dateController.dispose();
    startAppointmentController.dispose();
    endAppointmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthTitleWidget(title: 'تاريخ الحجز'),
                defaultTextField(
                    readOnly: true,
                    hintText: 'ادخل تاريخ الحجز',
                    controller: dateController,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.parse('1800-05-05'),
                        lastDate: DateTime.now(),
                      ).then((value) {
                        if (value != null) {
                          dateController.text = DateFormat.yMd().format(value);
                          print(dateController.text);
                        }
                      });
                    },
                    validator: (s) {}),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AuthTitleWidget(title: 'بداية الحجز'),
                          defaultTextField(
                              hintText: 'ادخل وقت بداية الحجز',
                              controller: startAppointmentController,
                              readOnly: true,
                              onTap: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then((value) {
                                  if (value != null) {
                                    startAppointmentController.text =
                                        value.format(context).toString();
                                  }
                                });
                              },
                              validator: (s) {})
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AuthTitleWidget(title: 'نهاية الحجز'),
                          defaultTextField(
                              hintText: 'ادخل وقت نهاية الحجز',
                              controller: endAppointmentController,
                              readOnly: true,
                              onTap: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then((value) {
                                  if (value != null) {
                                    endAppointmentController.text =
                                        value.format(context).toString();
                                  }
                                });
                              },
                              validator: (s) {})
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                const AuthTitleWidget(title: 'وقت الانتظار'),
                defaultDropDownButton(
                    value: '15 دقيقة',
                    items: ['15 دقيقة', "30 دقيقة", '45 دقيقة', '60 دقيقة'],
                    onChanged: (e) {}),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                    child: defaultButton(text: 'اضافة حجز', onPressed: () {})),
                SizedBox(
                  height: 20.h,
                ),
                const AppointmentMessage(
                  text: 'بأمكانك اضافة حجوزات لاسبوع واحد فقط',
                  svgPicture: 'assets/images/ipad.svg',
                  right: 20,
                  top: 30,
                  width: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
