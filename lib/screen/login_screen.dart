import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gac/widget/login_widget.dart';

import '../util/my_connectivity.dart';
import '../widget/dialogs.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
    return SafeArea(
      child: Scaffold(
        body:  LoginWidget()

      ),
    );
  }
}
