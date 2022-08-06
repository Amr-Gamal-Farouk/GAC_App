import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gac/provider/user_provider.dart';
import 'package:gac/screen/direcrory_favorite_screen.dart';
import 'package:gac/screen/employees_screen.dart';
import 'package:gac/screen/search_screen.dart';
import 'package:provider/provider.dart';

import '../widget/my_drawer.dart';
import '../widget/raido_widget.dart';

class HomeScreenOption2 extends StatefulWidget {
  @override
  _HomeScreenOption2State createState() => _HomeScreenOption2State();
}

class _HomeScreenOption2State extends State<HomeScreenOption2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late TextEditingController _textEditingController;
  late UserProvider _userState;
  bool isFilter = false;
  int? val=1;

  // late File file;

  pageView(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: MediaQuery.of(context).size.width,
                color: Colors.indigo,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
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
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              InkWell(
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: const Center(
                                    child:
                                    Icon(Icons.favorite, color: Colors.indigo),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FavoriteScreen(),
                                      ));
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),


                    Padding(
                      padding: const EdgeInsets.only(top: 10.0,bottom: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 36,
                              child: TextField(
                                textAlignVertical: TextAlignVertical.bottom,
                                style: TextStyle(fontSize: 15.0, height: 1.0, color: Colors.black,),
                                onTap: (){
                                  setState(() {
                                    isFilter=false;
                                  });
                                },
                                controller: _textEditingController,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          width: 0.8, color: Colors.white),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          width: 0.8, color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          width: 0.8, color: Colors.white),
                                    ),
                                    alignLabelWithHint: true,

                                    hintText: "Search",
                                    prefixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.search,
                                        // size: 30,
                                        // color: Colors.indigo,
                                      ),
                                      onPressed: () async {},
                                    ),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.clear),
                                      onPressed: () {
                                        setState(() {
                                          _textEditingController.clear();
                                          _userState.resetSearch();
                                        });
                                      },
                                    )),
                                cursorColor: Colors.indigo,
                                onChanged: (value) {
                                  setState(() {
                                    isFilter=false;
                                  });
                                  if (_textEditingController.text.isEmpty ||
                                      _textEditingController.text == " ") {
                                    _userState.resetSearch();
                                    _textEditingController.clear();
                                  } else {
                                    _userState.searchAction(
                                        searchKey:
                                            _textEditingController.text.trim(),
                                    value: val);
                                  }
                                },
                              ),
                            ),
                          ),
                           isFilter
                                ? IconButton(
                                    icon: const Icon(Icons.clear,color: Colors.white,),
                                    onPressed: () {
                                      setState(() {
                                        isFilter = false;
                                      });
                                    },
                                  )
                                : IconButton(
                              icon: const Icon(Icons.filter_alt_outlined, color: Colors.white,),
                                    onPressed: () {
                                      setState(() {
                                        isFilter = true;

                                      });
                                    },

                                  ),

                        ],
                      ),
                    ),
                    isFilter?Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio<int>(
                                activeColor: Colors.white,
                                value: 1,
                                groupValue: val,
                                onChanged: (int? value){
                                  setState(() {
                                    val=value;
                                  });
                                }
                            ),
                            // const SizedBox(width: 2,),
                            const Text("Name",style: TextStyle(color: Colors.white),)


                          ],
                        ),
                        Row(
                          children: [
                            Radio<int>(
                                activeColor: Colors.white,
                                value: 2,
                                groupValue: val,
                                onChanged: (int? value){
                                  setState(() {
                                    val=value;
                                  });
                                }
                            ),
                            // const SizedBox(width: 2,),
                            const Text("Comp Name",style: TextStyle(color: Colors.white),)


                          ],
                        ),
                        Row(
                          children: [
                            Radio<int>(
                                activeColor: Colors.white,
                                value: 3,
                                groupValue: val,
                                onChanged: (int? value){
                                  setState(() {
                                    val=value;
                                  });
                                }
                            ),
                            // const SizedBox(width: 2,),
                            const Text("Depart",style: TextStyle(color: Colors.white),)


                          ],
                        )
                      ],
                    ):Container(),
                    // const Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 8),
                    //   child: Text(
                    //     "Our Directory",
                    //     style: TextStyle(
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.w400,
                    //         fontStyle: FontStyle.italic),
                    //   ),
                    // )
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    color: Colors.grey[200],
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 157,
                    child: EmployeesScreen(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),


          floatingActionButtonLocation: FloatingActionButtonLocation.miniStartDocked,

          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom:15),
            child: FloatingActionButton(
              child: const Icon(Icons.menu),
              onPressed: () => _scaffoldKey.currentState!.openDrawer(),
            ),
          ),

          drawerEnableOpenDragGesture: false,
          drawer:  MyDrawer(),

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
    _textEditingController = TextEditingController();
    _userState = Provider.of<UserProvider>(context, listen: false);
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
