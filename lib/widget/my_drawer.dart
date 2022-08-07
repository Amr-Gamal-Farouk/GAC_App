import 'dart:convert';

import 'package:flutter/material.dart';

import '../util/values/strings.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:220,
      color:Colors.indigo,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.contain,
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
        ),],),

          Container(
            width: 214,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(width: 1),
            ),
            child: Row(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                      // border: Border.all(color: Colors.indigo,width: 1),
                      image: DecorationImage(image: MemoryImage(base64Decode(Strings.profileImage.split(',').last)),
                          fit: BoxFit.contain),)
                ),
                const SizedBox(width: 8,),
                const Text("Ahmed Yasser"),

              ],
            ),
          )
      ],
    ),
    );
  }
}
