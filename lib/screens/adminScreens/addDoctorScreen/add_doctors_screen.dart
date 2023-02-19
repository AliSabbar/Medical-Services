import 'package:flutter/material.dart';
import 'package:medical_services/screens/adminScreens/widgets/customStepper.dart';
import 'package:medical_services/screens/adminScreens/widgets/stepOne.dart';
import 'package:medical_services/screens/adminScreens/widgets/stepThree.dart';

class AddDoctorScreen extends StatefulWidget {
  const AddDoctorScreen({super.key});

  @override
  State<AddDoctorScreen> createState() => _AddDoctorScreenState();
}

class _AddDoctorScreenState extends State<AddDoctorScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: const Text("اضافة طبيب"),
            ),
            body: const CustomStepper(
              stepOneContent:  StepOne(),
              stepThreeContent:  StepThree(
                isClinic: false,
              ),
            )));
  }
}
