import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gac/provider/user_provider.dart';
import 'package:gac/screen/mission.dart';
import 'package:gac/screen/vision.dart';
import 'package:gac/widget/custom_icon_text.dart';
import 'package:provider/provider.dart';

import '../util/values/strings.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, value, child) {
      return Stack(
        children: [
          Container(
            padding :EdgeInsets.only(left: 30),
            width:260,
            // color:Colors.indigo,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.indigo,
                    Colors.indigoAccent,
                    Colors.white
                  ],
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: EdgeInsets.only(bottom: 45,top: 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 8),
                          width: 60,
                          height: 60,
                          decoration:  BoxDecoration(
                            borderRadius:  BorderRadius.circular(50),
                            // border: Border.all(color: Colors.indigo,width: 1),
                            image: DecorationImage(image: MemoryImage(base64Decode(value.currentLoggedUserData!.photo.split(',').last)),
                                fit: BoxFit.contain),)
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(value.currentLoggedUserData!.firstName,style: const TextStyle(fontWeight: FontWeight.w800,
                            color: Colors.white, fontStyle: FontStyle.italic),overflow: TextOverflow.fade) ,
                        Text(value.currentLoggedUserData!.jobTitle,style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.white,)) ,
                      ],)
                    ],
                  ),
                ),

                CustomIconText(text: "Leave Balance", icon: Icons.celebration,tapAction: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Mission(),));
                }),
                CustomIconText(text: "Public Holidays", icon: Icons.holiday_village,tapAction: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Mission(),));
                }),
                CustomIconText(text: "Department Chart", icon: Icons.account_box,tapAction: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Mission(),));
                }),
                CustomIconText(text: "Mission", icon: Icons.work,tapAction: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Mission(),));
                }),
                CustomIconText(text: "Vision", icon: Icons.remove_red_eye_outlined,tapAction: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Vision(),));
                }),



              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 30,
            child: CustomIconText(text: "Logout", icon: Icons.logout,),
          )
        ],
      );
    },);
  }
}
