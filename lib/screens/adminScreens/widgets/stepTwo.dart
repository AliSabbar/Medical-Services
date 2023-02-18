import 'package:flutter/material.dart';
import 'package:medical_services/providers/doc_clinic_provider.dart';
import 'package:medical_services/screens/adminScreens/widgets/titleWidget.dart';
import 'package:provider/provider.dart';

import '../../../components/defaultDropDownButton.dart';
import '../../../components/defaultTextField.dart';
import '../../../settings/colors.dart';

class StepTwo extends StatefulWidget {
  const StepTwo({super.key});

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  TextEditingController cityController = TextEditingController();

// ! current location

  currentLocationFunc() {}

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthMQ = MediaQuery.of(context).size.width;
    double heightMQ = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTitleWidget(text: "الموقع", context: context),
        defaultDropDownButton(
            value: context.watch<DocAndClinicProvider>().initialGovernorate,
            items: context.watch<DocAndClinicProvider>().governorateList,
            onChanged: (value) {
              context
                  .read<DocAndClinicProvider>()
                  .changeDropValue(value: value, changeType: "governorate");
            }),
        customTitleWidget(text: "عنوان العيادة", context: context),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: defaultTextField(
                width: widthMQ * 0.65,
                hintText: 'ادخل المدينة',
                controller: cityController,
                validator: (s) {
                  return null;
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),

            // * current Location

            Expanded(
              child: GestureDetector(
                onTap: currentLocationFunc,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColors.containerColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    Icons.gps_fixed_rounded,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
