import 'package:flutter/material.dart';

class AddDoctorScreen extends StatelessWidget {
  const AddDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("اضافة طبيب"),
        ),
        body: Column(
          children: [ 
            Stepper(steps: [
              Step(title: Text('معلومات الحساب'), content: Text("data"))
            ])
          ],
        ),
      ),
    );
  }
}