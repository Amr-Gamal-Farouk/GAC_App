import 'package:flutter/material.dart';
import 'package:gac/provider/user_provider.dart';
import 'package:gac/screen/login_screen.dart';
import 'package:gac/screen/responsive_layout.dart';
import 'package:provider/provider.dart';

class StartApp extends StatefulWidget {
  const StartApp({Key? key}) : super(key: key);

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, value, child) {
      return (value.currentUser!=null)?ResponsiveLayout():LoginScreen();
    },);
  }
}
