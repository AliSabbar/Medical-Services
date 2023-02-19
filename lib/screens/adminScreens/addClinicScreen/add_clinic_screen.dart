import 'package:flutter/material.dart';
import 'package:medical_services/screens/adminScreens/widgets/customStepper.dart';
import 'package:medical_services/screens/adminScreens/widgets/sharedStep.dart';
import 'package:medical_services/screens/adminScreens/widgets/stepThree.dart';

class AddClinicScreen extends StatefulWidget {
  const AddClinicScreen({super.key});

  @override
  State<AddClinicScreen> createState() => _AddClinicScreenState();
}

class _AddClinicScreenState extends State<AddClinicScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("اضافة عيادة"),
            ),
            body: const CustomStepper(
              stepOneContent:  SharedStep(textName: 'اسم العيادة'),
              stepThreeContent:  StepThree(isClinic: true),
            )));
  }
}
