// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:io';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meshr_app/screens/drawing_page.dart';
import 'package:meshr_app/screens/image-help.dart';
import 'package:meshr_app/screens/main_menu.dart';
import 'package:meshr_app/screens/step-two-image.dart';
import 'package:meshr_app/screens/step-two-txt.dart';
import 'package:meshr_app/screens/step-two.dart';
import 'package:meshr_app/screens/view-output-img.dart';
import 'package:meshr_app/widgets/generate-footer.dart';
import 'package:meshr_app/widgets/generate-header.dart';
import 'package:meshr_app/widgets/image-to-image-choice.dart';
import 'package:meshr_app/widgets/proceed-button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class GenerateStepOneImage extends StatefulWidget {
  GenerateStepOneImage({
    Key? key,
  }) : super(key: key);

  @override
  State<GenerateStepOneImage> createState() => _GenerateStepOneImageState();
}

class _GenerateStepOneImageState extends State<GenerateStepOneImage> {
  File? _image;

  Future uploadImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final img = await saveImagePermanently(image.path);
      print("IMAGE PATH: ${img.path}");

      setState(() {
        _image = img;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future captureImage() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
      if (image == null) return;
      final img = await saveImagePermanently(image.path);
      print("IMAGE PATH: ${img.path}");

      setState(() {
        _image = img;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getExternalStorageDirectory();

    final name = basename(imagePath);
    final image = File('${directory?.path}/$name.jpeg');
    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEFB83C),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: ImageIcon(AssetImage("assets/images/back-icon.png")),
          iconSize: 40.0,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Color(0xFFEFB83C),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            GenerateHeaderText(
                header: "Step 1:",
                subheader: "Draw, capture or upload an image you want."),
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image2ImageChoice(
                    icon: 'assets/images/draw-icon.png',
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: ((context) {
                        return DrawingPage();
                      })));
                    }),
                Image2ImageChoice(
                    icon: 'assets/images/camera-icon.png',
                    onPressed: () {
                      captureImage().then((value) {
                        if (_image == null) {
                          setState(() {});
                        } else {
                          print("CHANGE NAVIGATION");
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GenerateStepTwoImage()));
                        }
                      });
                    }),
                Image2ImageChoice(
                    icon: 'assets/images/upload-icon.png',
                    onPressed: () {
                      uploadImage().then((value) {
                        if (_image == null) {
                          setState(() {});
                        } else {
                          print("CHANGE NAVIGATION");
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GenerateStepTwoImage()));
                        }
                      });
                    }),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: GenerateBottomNav(
        helpFunction: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) {
            return HelpScreen(
              header: "Define!",
              footer:
                  "Find the right words that would define your target design, the more specific your definition is the more specific the output will be.",
            );
          })));
        },
      ),
    );
  }
}
