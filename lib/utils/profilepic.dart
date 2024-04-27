import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/functions/databaseFunctions.dart';
import 'package:mealsapp/provider/controllerprovider.dart';
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
            : const AssetImage('assets/images/man.png')
                as ImageProvider<Object>,
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
                                content: SizedBox(
                              height: 200,
                              child: Consumer<controllerProvider>(
                                builder: (context, usernamecontrollerprovider, child) => 
                                 Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ElevatedButton.icon(
                                        onPressed: () {
                                          ProfilpicProvider.pickImage(
                                              ImageSource.gallery);
                                          update('Users', usernamecontrollerprovider.usernamecontroller.text, 'imageUrl',
                                              ProfilpicProvider);
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.browse_gallery),
                                        label: const Text('Upload from gallery')),
                                    ElevatedButton.icon(
                                        onPressed: () {
                                          ProfilpicProvider.pickImage(
                                              ImageSource.camera);
                                          update('Users',usernamecontrollerprovider.usernamecontroller.text, 'imageUrl',
                                              ProfilpicProvider);
                                
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.camera),
                                        label: const Text('Click from camera')),
                                    ElevatedButton.icon(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.cancel),
                                        label: const Text('cancel'))
                                  ],
                                ),
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
