// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import "package:flutter/material.dart";
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meshr_app/data/local-storage.dart';
import 'package:meshr_app/widgets/grid-add-button.dart';
import 'package:meshr_app/widgets/grid-item.dart';
import 'package:meshr_app/widgets/list-add-button.dart';
import 'package:meshr_app/widgets/list-item.dart';
import 'package:meshr_app/widgets/user-class.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  bool grid = false;
  int listLength = 2;

  // List objFileNames = [];
  // List thumbFileNames = [];

  final _myBox = Hive.box('FilesCollection');
  FilesLocalStorage fls = FilesLocalStorage();

  @override
  void initState() {
    // if this is the 1st time ever opening the app, create default data
    if (_myBox.get('OBJLIST') == null && _myBox.get('THUMBLIST') == null) {
      print("INIT"); // Debug purposes
      fls.createInitialData();
    }else{
      print("LOAD"); // Debug purposes
      fls.loadData();
    }

    super.initState();
  }
  // getData() async {
  //   final docUser = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc('m04TaTo6BhL7okPeMwR2');
  //   final snapshot = await docUser.get();
  //   if (snapshot.exists) {
  //     Map<String, dynamic>? data = snapshot.data();
  //     paths = data!['paths'];
  //     filenames = data['filenames']; // <-- The value you want to retrieve.
  //     // Call setState if needed.
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (grid == false) {
                  grid = true;
                } else {
                  grid = false;
                }
              });
            },
            icon: grid
                ? ImageIcon(AssetImage("assets/images/list-view-icon.png"))
                : ImageIcon(AssetImage("assets/images/grid-view-icon.png")),
            iconSize: 40.0,
            color: Color(0xFFEFB83C),
            splashColor: Colors.white,
            splashRadius: 120,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 1.2,
            color: Colors.white,
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  color: Color(0xFF2D2B2B),
                  height: double.infinity,
                ),
                Container(
                    // height: 300, //570 if no navbar
                    color: Color(0xFF2D2B2B),
                    child: grid
                        ?
                        // FutureBuilder(
                        //     future: getData(),
                        //     builder: (context, snapshot) {
                        //       return GridView.count(
                        //         crossAxisCount: 2,
                        //         children:
                        //             List.generate(paths.length + 1, (index) {
                        //           return index == paths.length
                        //               ? GridAddButton()
                        //               : GridItem(
                        //                   filename: filenames[index],
                        //                   path: paths[index]);
                        //         }),
                        //       );
                        //     },
                        //   )
                        GridView.count(
                            crossAxisCount: 2,
                            children: List.generate(fls.objFileNames.length + 1,
                                (index) {
                              return index == fls.objFileNames.length
                                  ? GridAddButton()
                                  : GridItem(
                                      obj: fls.objFileNames[index],
                                      thumb: fls.thumbFileNames[index]);
                            }),
                          )
                        :
                        // FutureBuilder(
                        //     future: getData(),
                        //     builder: (context, snapshot) {
                        //       return ListView(
                        //         children:
                        //             List.generate(paths.length + 1, (index) {
                        //           return index ==
                        //                   paths
                        //                       .length // Paths and Filenames should always have the same length
                        //               ? ListAddButton()
                        //               : ListItem(
                        //                   filename: filenames[index],
                        //                   path: paths[index]);
                        //         }),
                        //       );
                        //     }),
                        ListView(
                            children: List.generate(fls.objFileNames.length + 1,
                                (index) {
                              return index ==
                                      fls.objFileNames
                                          .length // Paths and Filenames should always have the same length
                                  ? ListAddButton()
                                  : ListItem(
                                      obj: fls.objFileNames[index],
                                      thumb: fls.thumbFileNames[index]);
                            }),
                          )
                    // ListView(
                    //       children: List.generate(listLength + 1, (index) {
                    //         return index == listLength
                    //             ? ListAddButton()
                    //             : ListItem();
                    //       }),
                    //     ),
                    ),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.transparent,
      //   onPressed: () {},
      //   child: ImageIcon(
      //     AssetImage("assets/images/help-icon.png"),
      //     size: double.infinity,
      //     color: Color(0xFFEFB83C),
      //   ),
      // ),
    );
  }
}
