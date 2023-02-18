import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_services/screens/adminScreens/widgets/titleWidget.dart';
import 'package:provider/provider.dart';

import '../../../components/defaultTextField.dart';
import '../../../components/showUploadImage.dart';
import '../../../providers/upload_image_provider.dart';

class SharedStep extends StatefulWidget {
  const SharedStep({super.key});

  @override
  State<SharedStep> createState() => _SharedStepState();
}

class _SharedStepState extends State<SharedStep> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    var scaffoldKey = GlobalKey<ScaffoldState>();
    @override
    void dispose() {
      usernameController.dispose();
      phoneController.dispose();
      passwordController.dispose();
      super.dispose();
    }

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            scaffoldKey.currentState!
                .showBottomSheet((context) => showUploadImage(
                    context: context,
                    showCamera: () {
                      context.read<UploadImageProvider>().uploadImage(
                            imageSource: ImageSource.camera,
                          );
                      Navigator.pop(context);
                    },
                    showGallery: () {
                      context.read<UploadImageProvider>().uploadImage(
                            imageSource: ImageSource.gallery,
                          );
                      Navigator.pop(context);
                    }));
          },
          child: context.watch<UploadImageProvider>().file != null
              ? CircleAvatar(
                  radius: 60,
                  backgroundColor: const Color(0xffD9D9D9),
                  backgroundImage:
                      FileImage(context.watch<UploadImageProvider>().file!),
                )
              : const CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xffD9D9D9),
                  child: Icon(
                    Icons.camera_alt,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
        ),
        customTitleWidget(text: "اختيار صورة", context: context),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customTitleWidget(text: "اسمك الرباعي", context: context),
            defaultTextField(
              hintText: 'ادخل اسمك الرباعي',
              controller: usernameController,
              validator: (s) {
                return null;
              },
            ),
            customTitleWidget(text: "رقم الهاتف", context: context),
            defaultTextField(
              hintText: ' رقم الهاتف',
              controller: phoneController,
              keyboardType: const TextInputType.numberWithOptions(),
              validator: (s) {
                return null;
              },
            ),
            customTitleWidget(text: "كلمة المرور", context: context),
            defaultTextField(
              hintText: 'ادخل كلمة المرور',
              controller: passwordController,
              validator: (s) {
                return null;
              },
            ),
          ],
        ),
      ],
    );
  }
}