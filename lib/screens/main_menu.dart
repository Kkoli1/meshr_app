// ignore_for_file: prefer_const_constructors

import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:hive/hive.dart';
import 'package:meshr_app/screens/bottom_navigation.dart';
import 'package:meshr_app/screens/notification_screen.dart';
import 'package:meshr_app/screens/step-one-3d.dart';
import 'package:meshr_app/screens/step-one-img.dart';
import '../data/local-storage.dart';
import '../widgets/menu_card.dart';

class MainMenu extends StatefulWidget {
  MainMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  bool selected = true;
  final user = FirebaseAuth.instance.currentUser!;
  String? googleDisplayName;

  final _myBox = Hive.box('FilesCollection');
  FilesLocalStorage fls = FilesLocalStorage();

  late List<CameraDescription> cameras;

  @override
  void initState() {
    // TODO: implement initState
    initCamera();
    if (_myBox.get('OBJLIST') == null && _myBox.get('THUMBLIST') == null) {
      print("INIT"); // Debug purposes
      fls.createInitialData();
    } else {
      print("LOAD"); // Debug purposes
      fls.loadData();
    }
    googleDisplayName = user.displayName!.split(" ")[0];

    super.initState();
  }

  void initCamera() async {
    cameras = await availableCameras();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "MESHR",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 45,
                        color: Color(0xFFEFB83C),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NotificationScreen()));
                      },
                      icon: ImageIcon(
                        AssetImage("assets/images/bell-icon.png"),
                      ),
                      iconSize: 45,
                      color: Color(0xFFEFB83C),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30),
                width: screenWidth,
                child: Text(
                  "Hi, ${googleDisplayName!}",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 32,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              SizedBox(
                height: 85,
              ),
              MainMenuCard(
                width: screenWidth,
                image: "assets/images/book-image.png",
                imageWidth: 285.0,
                text: "View Project",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BottomNavigation(
                            isGallery: true,
                            isClicked: false,
                            isImg: false,
                          )));
                },
              ),
              SizedBox(
                height: 70,
              ),
              MainMenuCard(
                width: screenWidth,
                image: "assets/images/cube-image.png",
                imageWidth: 176.0,
                text: "Generate",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GenerateStepOne3D(cameras: cameras)));
                },
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => GenerateStepOneImage()));
                        },
                        child: Text(
                          "Text -> Image",
                          style: TextStyle(
                              color: Colors.amber,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 17),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Image -> Image",
                          style: TextStyle(
                              color: Colors.amber,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 17),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BottomNavigation(
                          isGallery: false,
                          isClicked: false,
                          isImg: false,
                        )));
              },
              icon: ImageIcon(AssetImage("assets/images/settings-icon.png")),
              color: Color(0xFFEFB83C),
              iconSize: 45,
            ),
            IconButton(
              onPressed: () {},
              icon: ImageIcon(AssetImage("assets/images/help-icon.png")),
              color: Color(0xFFEFB83C),
              iconSize: 40,
            ),
          ],
        ),
      ),
    );
  }
}
