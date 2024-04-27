import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/provider/imageprovider.dart';
import 'package:provider/provider.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({super.key});

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {

  @override
  Widget build(BuildContext context) {
    return Consumer<imageProvider>(
      builder: (context, ProfilpicProvider, child) => CircleAvatar(
        backgroundImage: ProfilpicProvider.image != null
            ? FileImage(File(ProfilpicProvider.image!.path))
            : AssetImage('assets/images/myimage.jpg') as ImageProvider<Object>,
        radius: 70,
        child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: textcolor),
                    color: primarycolor,
                    shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                content: Container(
                              height: 200,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ElevatedButton.icon(
                                      onPressed: () {
                                        ProfilpicProvider.pickImage(ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.browse_gallery),
                                      label: Text('Upload from gallery')),
                                  ElevatedButton.icon(
                                      onPressed: () {
                                       ProfilpicProvider.pickImage(ImageSource.camera);
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.camera),
                                      label: Text('Click from camera')),
                                  ElevatedButton.icon(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.cancel),
                                      label: Text('cancel'))
                                ],
                              ),
                            ));
                          });
                    },
                    icon: Icon(
                      Icons.edit,
                      color: secondarycolor.withOpacity(0.6),
                    )))),
      ),
    );
  }
}
