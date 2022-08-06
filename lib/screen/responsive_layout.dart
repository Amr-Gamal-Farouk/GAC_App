import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gac/screen/home_screen.dart';
import 'package:gac/screen/home_screen_option_two.dart';
import 'package:gac/util/my_connectivity.dart';
import 'package:provider/provider.dart';

import '../widget/dialogs.dart';

class ResponsiveLayout extends StatefulWidget {
  @override
  _ResponsiveLayoutState createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      MyConnectivity.instance.initialise();
      MyConnectivity.instance.myStream.listen((onData) {
        if (MyConnectivity.instance.isIssue(onData)) {
          if (MyConnectivity.instance.isShow == false) {
            MyConnectivity.instance.isShow = true;
            showDialogNotInternet( context: context).then((onValue) {
              MyConnectivity.instance.isShow = false;
            });
          }
        } else {
          if (MyConnectivity.instance.isShow == true) {
            Navigator.of(context).pop();
            MyConnectivity.instance.isShow = false;
          }
        }
      });
//      startTest();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, dimens) {
          return HomeScreenOption2();
          // if (dimens.maxWidth > 1000) {
          //   return HomeScreen(crossAxisCount: 6,);
          // } else if (dimens.maxWidth > 800 ) {
          //   return HomeScreen(crossAxisCount: 5,);
          // } else if (dimens.maxWidth >600) {
          //   return HomeScreen(crossAxisCount: 4,);
          // }else if (dimens.maxWidth >430) {
          //   return HomeScreen(crossAxisCount: 3,);
          // } else {
          //   return HomeScreen(crossAxisCount: 2,);
          // }
        },
      ),
    );
  }
}