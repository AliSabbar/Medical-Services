import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import 'package:medical_services/components/authTitleWidget.dart';
import 'package:medical_services/components/defaultButton.dart';
import 'package:medical_services/components/defaultTextField.dart';
import 'package:medical_services/components/doctorCard.dart';
import 'package:medical_services/network/local/shared_helper.dart';
import 'package:medical_services/providers/auth_provider.dart';
import 'package:medical_services/providers/booking_provider.dart';
import 'package:provider/provider.dart';

import '../../components/defaultDropDownButton.dart';
import '../../components/defaultPhoneNumber.dart';
import '../../settings/colors.dart';
import '../../settings/routes_manger.dart';

class ConfirmAppointment extends StatefulWidget {
  ConfirmAppointment({super.key, required this.data});
  var data;
  @override
  State<ConfirmAppointment> createState() => _ConfirmAppointmentState();
}

class _ConfirmAppointmentState extends State<ConfirmAppointment> {
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    phoneNumberController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var user = context.read<AuthProvider>().userModel?.data;
    var provBooking = context.read<BookingProvider>();
    print("Auth = ${context.read<AuthProvider>().userModel?.data.phoneNumber}");
    phoneNumberController.text = user!.phoneNumber.substring(4);
    userNameController.text = user.name;
    ageController.text = user.setting.dob.toString().substring(0, 10);
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('حجز موعد'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                const AuthTitleWidget(title: 'اسمك الثلاثي'),
                defaultTextField(
                    hintText: 'محمد علي كلاي',
                    controller: userNameController,
                    validator: (v) {}),
                SizedBox(
                  height: 5.h,
                ),
                const AuthTitleWidget(title: 'رقم الهاتف'),
                DefaultPhoneNumber(
                    phoneNumberController: phoneNumberController),
                SizedBox(
                  height: 5.h,
                ),
                const AuthTitleWidget(title: 'ادخل عمر المريض'),
                defaultTextField(
                    readOnly: true,
                    hintText: ageController.text,
                    controller: ageController,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.parse('1800-05-05'),
                        lastDate: DateTime.now(),
                      ).then((value) {
                        if (value != null) {
                          ageController.text = DateFormat.yMd().format(value);
                          print(ageController.text);
                        }
                      });
                    },
                    validator: (v) {}),
                SizedBox(
                  height: 5.h,
                ),
                const AuthTitleWidget(title: 'الجنس'),
                defaultDropDownButton(
                    value: context.watch<AuthProvider>().initialGender,
                    items: context.watch<AuthProvider>().genderList,
                    onChanged: (v) {
                      context.read<AuthProvider>().changeGenderValue(value: v);
                    }),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "سيتم الحجز عند",
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
                SizedBox(
                  height: 7.h,
                ),
                //! Doctor Card
                DoctorCard(data: widget.data),
                SizedBox(
                  height: 15.h,
                ),
                provBooking.isLoadingConf
                    ? const Center(child: CircularProgressIndicator())
                    : Center(
                        child: defaultButton(
                            text: 'تأكيد الحجز',
                            onPressed: () {
                              print(widget.data['time']);
                              print(widget.data['date']);
                              print(widget.data['drModel'].id);

                              provBooking.confirmAppointment(
                                  phoneNumber: phoneNumberController.text,
                                  name: userNameController.text,
                                  time: widget.data['time'],
                                  date: widget.data['date'],
                                  drId: widget.data['drModel'].id,
                                  userId: SharedHelper.getData(key: 'userId'),
                                  context: context,
                                  drModel: widget.data['drModel']);
                            }),
                      ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  DoctorCard({super.key, required this.data});
  var data;
  @override
  Widget build(BuildContext context) {
    var mounth = data['date'].substring(5).split('-').first;
    var day = data['date'].substring(5).split('-').last;
    print("MOUNTH = $mounth");
    print("DAY = $day");
    return Container(
      width: 333.w,
      height: 150.h,
      decoration: BoxDecoration(
          color: AppColors.backgroundCardColor,
          borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        children: [
          Container(
            width: 85.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZG9jdG9yfGVufDB8fDB8fA%3D%3D&w=500&q=80'),
                  fit: BoxFit.cover,
                )),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 7.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data['drModel'].user.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 60.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          '${data['drModel'].cost} الف',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(data['drModel'].magerSpecialties.toString(),
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 55.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.r),
                                bottomRight: Radius.circular(20.r))),
                        child: Center(
                          child: Text(
                            "$day - $mounth",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Container(
                        height: 38.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.8),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                bottomLeft: Radius.circular(20.r))),
                        child: Center(
                          child: Text(
                            'الساعة ${context.read<BookingProvider>().convertTime(time: data['time'])}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
