// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";



class ViewGallery3D extends StatelessWidget {
  const ViewGallery3D({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF2D2B2B),
        title: Text(
          "TITLE",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Color(0xFFEFB83C),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: ImageIcon(AssetImage("assets/images/back-icon.png")),
          iconSize: 40.0,
          color: Color(0xFFEFB83C),
        ),
        actions: [
          IconButton(
          onPressed: () {},
          icon: ImageIcon(AssetImage("assets/images/gdrive-icon.png")),
          iconSize: 40.0,
          color: Color(0xFFEFB83C),
        ),
          IconButton(
          onPressed: () {},
          icon: ImageIcon(AssetImage("assets/images/trash-icon.png")),
          iconSize: 40.0,
          color: Color(0xFFEFB83C),
        ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xFFEFB83C),
            height: 2,
            width: double.infinity,
          ),
          Expanded(
            child: Container(
              // THIS IS WHERE WE CONTAIN THE 3D OBJECT VIEWER
              //height: 534, //570 if no navbar
              color: Color(0xFF2D2B2B),
            ),
          ),
        ],
      ),
    );
  }
}
