import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_services/components/defaultButton.dart';
import 'package:medical_services/components/defaultTextField.dart';
import 'package:medical_services/screens/adminScreens/widgets/addDoctors.dart';
import 'package:medical_services/screens/adminScreens/widgets/addSpecialty.dart';

import '../../../components/specialtyContainer.dart';
import '../../../components/uploadImageWidget.dart';

class AddSpecialtyScreen extends StatefulWidget {
  const AddSpecialtyScreen({super.key});

  @override
  State<AddSpecialtyScreen> createState() => _AddSpecialtyScreenState();
}

class _AddSpecialtyScreenState extends State<AddSpecialtyScreen> {
  TextEditingController specialtyName = TextEditingController();
  @override
  void dispose() {
    specialtyName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("اضافة تخصص"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  const UploadImageWidget(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: defaultTextField(
                            width: 200.w,
                            hintText: 'اضافة تخصص',
                            controller: specialtyName,
                            validator: (s) {}),
                      ),
                      Flexible(
                        child: defaultButton(
                            text: 'اضافة',
                            onPressed: () {},
                            width: 120,
                            height: 50),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //! specialtyList
                  SizedBox(
                      child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) => specialtyContainer(
                        image:
                            "https://media.istockphoto.com/id/1313979071/photo/differently-sized-wooden-models-of-houses-on-table-with-green-background-the-concept-of-size.jpg?b=1&s=170667a&w=0&k=20&c=7KE3RMX6UjjvGAN7DvNeK-JiNm5aS_0Qh9hkIk8nF8E=",
                        title: "قلبية",
                        isAdmin: true),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20.h,
                    ),
                  ))
                ]),
          ),
        ),
      ),
    );
  }
}
