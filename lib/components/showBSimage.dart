import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ShowBSImage extends StatelessWidget {
  const ShowBSImage({super.key,required this.showCamera,required this.showGallery});
  final VoidCallback showCamera;
  final VoidCallback showGallery;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          onTap: showCamera,
          leading: const Icon(Icons.camera_alt),
          title: const Text(
            'التقط صورة',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          onTap: showGallery,
          leading: const Icon(Icons.insert_photo),
          title: const Text(
            'اختر من المعرض',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        )
      ],
      ),
    );
  }
}
