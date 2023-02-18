import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageProvider extends ChangeNotifier {
  File? file;

  var imagePicker = ImagePicker();


  // imagePicker

  uploadImage({required imageSource}) async {
    try {
      var imagePicked = await imagePicker.pickImage(source: imageSource);
      if (imagePicked != null) {
        file = File(imagePicked.path);

        if (file!.lengthSync() > 2000000) {
          print("=========THE SIZE OF PICTURE IS OVER 2 MB");
          file = null;
          imagePicked = null;
          notifyListeners();
        } else {
          var nameImage = imagePicked.name;

          var random = Random().nextInt(10000000);

          var imagePickedName = '$random$nameImage';

          print(file!.path);

          notifyListeners();
        }
      }
    } catch (e) {
      print("Error in Pick Image Gallery = $e");
    }
  }

  removeUserPicture() {
    file = null;
    notifyListeners();
  }
}
