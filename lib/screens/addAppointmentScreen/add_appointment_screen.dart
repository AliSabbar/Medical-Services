import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medical_services/components/appointmentMessage.dart';
import 'package:medical_services/components/defaultButton.dart';
import 'package:medical_services/components/defaultDropDownButton.dart';
import 'package:medical_services/network/local/shared_helper.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:medical_services/providers/booking_provider.dart';
import 'package:provider/provider.dart';
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
  var formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    dateController.dispose();
    startAppointmentController.dispose();
    endAppointmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provRead = context.read<BookingProvider>();
    var provWatch = context.watch<BookingProvider>();
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Form(
              key: formKey,
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
                          firstDate: DateTime.now(),
                          lastDate: DateTime.parse('2030-05-05'),
                        ).then((value) {
                          if (value != null) {
                            dateController.text =
                                DateFormat('yyy-MM-dd').format(value);
                            print(dateController.text);
                          }
                        });
                      },
                      validator: (s) {
                        if (s!.isEmpty) {
                          return "لايمكن ان يكون هذا الحقل فارغا";
                        }
                      }),
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
                            Directionality(
                              textDirection: ui.TextDirection.ltr,
                              child: defaultTextField(
                                  textAlign: TextAlign.center,
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
                                  validator: (s) {
                                    if (s!.isEmpty) {
                                      return "لا يمكن ان يكون هذا الحقل فارغا";
                                    }
                                  }),
                            )
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
                            Directionality(
                              textDirection: ui.TextDirection.ltr,
                              child: defaultTextField(
                                  textAlign: TextAlign.center,
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
                                  validator: (s) {
                                    if (s!.isEmpty) {
                                      return "لايمكن ان يكون هذا الحقل فارغا";
                                    }
                                  }),
                            )
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
                      value: provWatch.initialWaitTime,
                      items: provWatch.waitTime,
                      onChanged: (e) {
                        provRead.changeWaitTime(value: e);
                      }),
                  SizedBox(
                    height: 20.h,
                  ),
                  provWatch.isLoadingAddApp
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Center(
                          child: defaultButton(
                              text: 'اضافة حجز',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  print(
                                    provRead.convertTime24H(
                                        time: startAppointmentController.text),
                                  );
                                  print(
                                    provRead.convertTime24H(
                                        time: endAppointmentController.text),
                                  );
                                  print(provRead.initialWaitTime.split(" ").first);
                                  print(dateController.text);
                                  print(context
                                      .read<AuthProvider>()
                                      .doctorModel
                                      ?.data.id);
                                  provRead.addAppointment(
                                      startAppointment: provRead.convertTime24H(
                                          time:
                                              startAppointmentController.text),
                                      endAppointment: provRead.convertTime24H(
                                          time: endAppointmentController.text),
                                      time: provRead.initialWaitTime.split(" ").first,
                                      date: dateController.text,
                                      drId: context
                                          .read<AuthProvider>()
                                          .doctorModel!
                                          .data
                                          .id);
                                }
                              })),
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
      ),
    );
  }
}
