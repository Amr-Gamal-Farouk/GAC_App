import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gac/screen/direcrory_favorite_screen.dart';
import 'package:gac/screen/employees_screen.dart';

class HomeScreen extends StatefulWidget {
  int crossAxisCount;

  HomeScreen({required this.crossAxisCount});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late File file;
  List category = [
    {"text": "Directory", "icon": "assets/images/directory.png"},
    {"text": "Favorites", "icon": "assets/images/favourite.png"},
    {"text": "IT Support", "icon": "assets/images/IT.png"},
    {"text": "News", "icon": "assets/images/news.png"},
    {"text": "Notification", "icon": "assets/images/notifications.png"},
    {"text": "Calender", "icon": "assets/images/calendar.png"},
  ];

  pageView(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                height: 135,
                width: MediaQuery.of(context).size.width,
                color: Colors.indigo,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          "assets/images/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Row(
                      children: const [
                        Text(
                          "GAC",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          " EGYPT",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Text(
                      "Delivering your strategy",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 80,
                        decoration: const BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      Container(),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 157,
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: GridView.builder(
                        itemCount: category.length,
                        // physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          // childAspectRatio: (MediaQuery.of(context).size.width /
                          //         MediaQuery.of(context).size.height) +
                          //     0.3 /*0.8*/,
                          // crossAxisSpacing: 5.0,
                          // mainAxisSpacing: 5.0,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          crossAxisCount: widget.crossAxisCount,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 25),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),

                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      decoration:  BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(category[index]["icon"].toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // const SizedBox(
                                  //   height: 10,
                                  // ),
                                  Text(
                                    category[index]["text"],
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              selectAction(context, index);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  void selectAction(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EmployeesScreen(),
          ));
    } else if (index == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FavoriteScreen(),
          ));

    } else if (index == 2) {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => TeamView(),
      //     ));
    }
  }

  // selectImage(parentContext) {
  //   return showDialog(
  //       context: parentContext,
  //       builder: (context) {
  //         return SimpleDialog(
  //           title: Text("Create Post"),
  //           children: [
  //             SimpleDialogOption(
  //               child: Text("Photo with camera"),
  //               onPressed: cameraImageAction,
  //             ),
  //             SimpleDialogOption(
  //               child: Text("Image From Gallery"),
  //               onPressed: galleryImageAction,
  //             ),
  //             SimpleDialogOption(
  //               child: Text("Cancel"),
  //               onPressed: () => Navigator.of(context).pop(),
  //             )
  //           ],
  //         );
  //       });
  // }

  // cameraImageAction() async {
  //   Navigator.of(context).pop();
  //
  //   PickedFile? file = await ImagePicker().getImage(
  //       source: ImageSource.camera,
  //       maxHeight: 675,
  //       maxWidth: 960,
  //       imageQuality: 85);
  //   if (file != null) {
  //     print(file.path);
  //     setState(() {
  //       this.file = File(file.path);
  //     });
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => UploadImageView(this.file),
  //         ));
  //   }
  // }

  // galleryImageAction() async {
  //   Navigator.of(context).pop();
  //
  //   PickedFile? file = await ImagePicker()
  //       .getImage(source: ImageSource.gallery, maxHeight: 675, maxWidth: 960);
  //   if (file != null) {
  //     print(file.path);
  //     setState(() {
  //       this.file = File(file.path);
  //     });
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => UploadImageView(this.file),
  //         ));
  //   }
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(
        MediaQuery.of(context).size.width / MediaQuery.of(context).size.height);
    return pageView(context);
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
