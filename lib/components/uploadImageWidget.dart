import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_services/components/showBSimage.dart';
import 'package:provider/provider.dart';

import '../providers/upload_image_provider.dart';
import 'authTitleWidget.dart';

class UploadImageWidget extends StatelessWidget {
  const UploadImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            showBottomSheet(
                context: context,
                builder: (context) => ShowBSImage(showCamera: () {
                      context.read<UploadImageProvider>().uploadImage(
                            imageSource: ImageSource.camera,
                          );
                      Navigator.pop(context);
                    }, showGallery: () {
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
        const AuthTitleWidget(title: 'رقم الهاتف')
      ],
    );
  }
}
