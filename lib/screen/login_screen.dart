import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gac/screen/responsive_layout.dart';
import 'package:gac/widget/login_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  LoginWidget()

      ),
    );
  }
}
