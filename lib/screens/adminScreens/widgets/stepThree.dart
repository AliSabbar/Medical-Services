import 'package:flutter/material.dart';
import 'package:medical_services/screens/adminScreens/widgets/rowTextFild.dart';
import 'package:medical_services/screens/adminScreens/widgets/titleWidget.dart';
import 'package:provider/provider.dart';

import '../../../components/defaultDropDownButton.dart';
import '../../../components/defaultTextField.dart';
import '../../../providers/add_doctors_provider.dart';
import 'addSpecialty.dart';

class StepThree extends StatefulWidget {
  const StepThree({super.key});

  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  final TextEditingController descController = TextEditingController();
  final TextEditingController timeToOpenController = TextEditingController();
  final TextEditingController timeToCloseController = TextEditingController();
  final TextEditingController expController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();

  @override
  void dispose() {
    descController.dispose();
    timeToOpenController.dispose();
    timeToCloseController.dispose();
    expController.dispose();
    moneyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthMQ = MediaQuery.of(context).size.width;
    double heightMQ = MediaQuery.of(context).size.height;
    var provRead = context.read<AddDoctorsProvider>();
    var provWatch = context.watch<AddDoctorsProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTitleWidget(text: "الوصف", context: context),
        defaultTextField(
          minLines: 1,
          maxLines: 10,
          hintText: 'ادخل وصف عن الدكتور',
          controller: descController,
          validator: (s) {
            return null;
          },
        ),
        customTitleWidget(text: "التخصص الرئيسي", context: context),
        defaultDropDownButton(
            value: provWatch.initialSpecialty,
            items: provWatch.specialtyList,
            onChanged: (value) {
              provRead.changeDropValue(value: value, changeType: "specialty");
            }),
        customTitleWidget(text: "التخصصات الفرعية", context: context),
        addSpecialty(
            context: context,
            value: provWatch.secondSpecialty,
            items: provWatch.secondSpecialtyList,
            onChanged: (value) {
              provRead.changeDropValue(
                  value: value, changeType: "secondSpecialty");
            }),
        SizedBox(
          height: heightMQ * 0.01,
        ),
        rowTextField(
            context: context,
            oneText: "بداية الاستشارة",
            secondText: "نهاية الاستشارة",
            oneController: timeToOpenController,
            secondController: timeToCloseController,
            oneValidator: (s) {},
            secondValidator: (s) {},
            onTap: () {
              showTimePicker(context: context, initialTime: TimeOfDay.now())
                  .then((value) {
                timeToOpenController.text = value!.format(context).toString();
              });
            },
            secondOnTap: () {
              showTimePicker(context: context, initialTime: TimeOfDay.now())
                  .then((value) {
                timeToCloseController.text = value!.format(context).toString();
              });
            }),
        SizedBox(
          height: heightMQ * 0.02,
        ),
        rowTextField(
            context: context,
            oneText: "الخبرات",
            secondText: "الكشفية",
            oneController: expController,
            secondController: moneyController,
            oneValidator: (s) {},
            secondValidator: (s) {}),
      ],
    );
  }
}
