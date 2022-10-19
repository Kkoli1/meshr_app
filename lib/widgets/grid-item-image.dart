// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:meshr_app/screens/bottom_navigation.dart';

class GridItemImage extends StatefulWidget {
  String img;
  GridItemImage({Key? key, required this.img,}) : super(key: key);

  @override
  State<GridItemImage> createState() => _GridItemImageState();
}

class _GridItemImageState extends State<GridItemImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(11))),
        margin: EdgeInsets.only(top: 35, left: 15, right: 15),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Color(0xFFEFB83C),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.0))),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BottomNavigation(
                          isGallery: true,
                          isClicked: true,
                          isImg: true,
                        )));
          },
          child: Container(child: Text("Testy"),),
        ));
  }
}
