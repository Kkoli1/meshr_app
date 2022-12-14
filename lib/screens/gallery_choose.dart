// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:meshr_app/screens/bottom_navigation.dart';
import 'package:meshr_app/screens/gallery_3d.dart';
import 'package:meshr_app/screens/gallery_image.dart';

class GalleryMain extends StatefulWidget {
  int imgLength;
  int objLength;
  GalleryMain({
    Key? key,
    required this.imgLength,
    required this.objLength,
  }) : super(key: key);

  @override
  State<GalleryMain> createState() => _GalleryMainState();
}

class _GalleryMainState extends State<GalleryMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF2D2B2B),
        title: Text(
          "Gallery",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: ImageIcon(AssetImage("assets/images/back-icon.png")),
          iconSize: 40.0,
          color: Color(0xFFEFB83C),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  color: Color(0xFF2D2B2B),
                  height: double.infinity,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final result = await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => GalleryImage()));
                        print("RESULT: $result");
                        if (result) {
                          print("PASOK RESULT!");
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (context) => BottomNavigation(
                                        isGallery: true,
                                        isClicked: false,
                                        isImg: false,
                                        img: "",
                                      )));
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                              child: Image.asset(
                                'assets/images/img-thumb.png',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "Images",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              widget.imgLength.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //       content: Text(
                    //         "Coming Soon!",
                    //         style: TextStyle(
                    //             fontFamily: 'Roboto',
                    //             fontWeight: FontWeight.w700,
                    //             fontSize: 15),
                    //         textAlign: TextAlign.center,
                    //       ),
                    //       backgroundColor: Color(0xFFEFB83C),
                    //       duration: Duration(seconds: 3),
                    //       behavior: SnackBarBehavior.floating,
                    //       margin: EdgeInsets.symmetric(
                    //           vertical: 15, horizontal: 60),
                    //       elevation: 0,
                    //     ));
                    //     // Navigator.of(context).push(MaterialPageRoute(
                    //     //     builder: (context) => Gallery3D()));
                    //   },
                    //   child: Container(
                    //     margin: EdgeInsets.symmetric(horizontal: 20),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Container(
                    //           clipBehavior: Clip.antiAlias,
                    //           height: 150,
                    //           width: double.infinity,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(12),
                    //             color: Colors.white,
                    //           ),
                    //           child: Image.asset(
                    //             'assets/images/mesh-thumb.png',
                    //             fit: BoxFit.fitWidth,
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: 7,
                    //         ),
                    //         Text(
                    //           "3D Models",
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //             fontFamily: 'Roboto',
                    //             fontWeight: FontWeight.w700,
                    //             fontSize: 20,
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: 7,
                    //         ),
                    //         Text(
                    //           widget.objLength.toString(),
                    //           style: TextStyle(
                    //             color: Colors.grey,
                    //             fontFamily: 'Roboto',
                    //             fontWeight: FontWeight.w300,
                    //             fontSize: 18,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
