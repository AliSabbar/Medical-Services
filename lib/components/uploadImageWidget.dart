import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_services/components/showUploadImage.dart';
import 'package:provider/provider.dart';

import '../providers/upload_image_provider.dart';
import '../screens/adminScreens/widgets/titleWidget.dart';

class UploadImageWidget extends StatelessWidget {
  const UploadImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          GestureDetector(
          onTap: () {
            showBottomSheet(
                context: context,
                builder: (context) => showUploadImage(
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
        
      ],
    );
  }
}