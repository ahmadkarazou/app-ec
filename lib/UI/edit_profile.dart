import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widget/button.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? image;
  final imagePicker = ImagePicker();

  uploadImage() async {
    var picImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (picImage != null) {
      image = File(picImage!.path);
    } else {}
    setState(() {});
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController gender = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffFFFBFE),
          leading: IconButton(
            iconSize: 30,
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: hei * 0.05),
              const Text(
                'Profile Setting',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: hei * 0.05),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 70.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: (image == null)
                          ? Image(
                              image: AssetImage(
                                  'assets/images/06361988-ab1d-48cb-bdc0-8fb7b6b25a04.jpg'),
                            )
                          : Image.file(
                              image!,
                              width: double.infinity,
                              fit: BoxFit.fitWidth,
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: .1,
                    right: 1,
                    child: CircleAvatar(
                      backgroundColor: Color(0xff74918B),
                      child: IconButton(
                          onPressed: uploadImage,
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            size: 18,
                          )),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Full Name'),
                      keyboardType: TextInputType.name,
                      controller: name,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      controller: name,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Gender'),
                      keyboardType: TextInputType.text,
                      controller: name,
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Phone Number'),
                      keyboardType: TextInputType.number,
                      controller: name,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: buttonPrimary,
                child: const Text('Save Changes',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
