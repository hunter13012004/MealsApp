import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imageProvider extends ChangeNotifier{

   XFile? image;
     final ImagePicker _picker = ImagePicker();


    Future<void> pickImage(ImageSource imageSource) async {
    try {
      final XFile? selectedImage = await _picker.pickImage(source: imageSource);
      if (selectedImage != null) {
          image = selectedImage;
          notifyListeners();
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  } 
  
}