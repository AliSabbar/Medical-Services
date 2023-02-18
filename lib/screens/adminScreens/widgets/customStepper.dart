import 'package:flutter/material.dart';
import 'package:medical_services/screens/adminScreens/widgets/stepTwo.dart';
import 'package:medical_services/screens/adminScreens/widgets/stepOne.dart';
import 'package:medical_services/screens/adminScreens/widgets/stepThree.dart';
import 'package:provider/provider.dart';

import '../../../providers/add_doctors_provider.dart';
import '../../../settings/colors.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    double widthMQ = MediaQuery.of(context).size.width;
    double heightMQ = MediaQuery.of(context).size.height;
    var provRead = context.read<AddDoctorsProvider>();
    var provWatch = context.watch<AddDoctorsProvider>();
    return Stepper(
      type: StepperType.horizontal,
      currentStep: provWatch.currentStep,
      onStepTapped: (newStep) {
        provRead.onStepTapped(newStep: newStep);
      },
      onStepContinue: () {
        provRead.onStepContinue();
      },
      onStepCancel: () {
        provRead.onStepCancel();
      },
      // * NEXT , BACK BUTTON
      controlsBuilder: (
        context,
        details,
      ) =>
          Container(
        margin: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (provWatch.currentStep != 0)
              Flexible(
                child: MaterialButton(
                  onPressed: () {
                    details.onStepCancel!();
                  },
                  color: Colors.grey[400],
                  textColor: Colors.black38,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Text("رجوع"),
                ),
              ),
            Flexible(
              child: MaterialButton(
                minWidth: 200,
                height: 40,
                onPressed: () {
                  if (provWatch.currentStep <= 1) {
                    details.onStepContinue!();
                  } else {
                    //! here send data
                    print("alo");
                  }
                },
                color: AppColors.primaryColor,
                textColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: provWatch.currentStep > 1
                    ? const Text(
                        "اضافة",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    : const Text(
                        "التالي",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          ],
        ),
      ),
      steps: [
        Step(
            state: provWatch.currentStep > 0
                ? StepState.complete
                : StepState.indexed,
            isActive: provWatch.currentStep == 0 ? true : false,
            title: const Text('الحساب'),
            content: const StepOne()),
        Step(
          state: provWatch.currentStep > 1
              ? StepState.complete
              : StepState.indexed,
          isActive: provWatch.currentStep == 1 ? true : false,
          title: const Text('الموقع'),
          content: const StepTwo(),
        ),
        Step(
          isActive: provWatch.currentStep == 2 ? true : false,
          title: const Text('التفاصيل'),
          content: const StepThree(),
        ),
      ],
    );
  }
}
