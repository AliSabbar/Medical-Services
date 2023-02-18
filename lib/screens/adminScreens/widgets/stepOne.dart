import 'package:flutter/material.dart';
import 'package:medical_services/screens/adminScreens/widgets/sharedStep.dart';
import 'package:medical_services/screens/adminScreens/widgets/titleWidget.dart';
import 'package:provider/provider.dart';

import '../../../components/defaultDropDownButton.dart';
import '../../../components/defaultTextField.dart';
import '../../../providers/add_doctors_provider.dart';

class StepOne extends StatefulWidget {
  const StepOne({super.key});

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  @override
  Widget build(BuildContext context) {
    double widthMQ = MediaQuery.of(context).size.width;
    double heightMQ = MediaQuery.of(context).size.height;
    var provRead = context.read<AddDoctorsProvider>();
    var provWatch = context.watch<AddDoctorsProvider>();
    final TextEditingController ageController = TextEditingController();
    @override
    void dispose() {
      ageController.dispose();
      super.dispose();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SharedStep(),
        customTitleWidget(text: "تاريخ الميلاد", context: context),
        defaultTextField(
          hintText: 'ادخل تاريخ الميلاد',
          controller: ageController,
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.parse('1990-05-05'),
              lastDate: DateTime.parse(DateTime.now().toString()),
            ).then((value) {
              ageController.text = provWatch.setAge(date: value);
            });
          },
          validator: (s) {
            return null;
          },
        ),
        customTitleWidget(text: "الجنس", context: context),
        defaultDropDownButton(
            value: provWatch.initialValue,
            items: provWatch.genderList,
            onChanged: (value) {
              provRead.changeDropValue(value: value, changeType: "gender");
            })
      ],
    );
  }
}
