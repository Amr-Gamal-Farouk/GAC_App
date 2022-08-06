import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gac/provider/user_provider.dart';
import 'package:gac/screen/home_screen_option_two.dart';
import 'package:gac/screen/login_screen.dart';
import 'package:gac/screen/responsive_layout.dart';
import 'package:gac/screen/search_screen.dart';
import 'package:gac/screen/splash_screen.dart';
import 'package:gac/util/theme.dart';
import 'package:provider/provider.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.indigo
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: appTheme,
              home: const SplashScreen());
        } else {
          // Loading is done, return the app:
          return MultiProvider(

            providers: [
              ChangeNotifierProvider.value(
                value: UserProvider(),
              ),
            ],

            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'GAC Egypt',
              theme: appTheme,
              home:  LoginScreen(),//HomeScreenOption2(),
            ),
          );
        }
      },
    ) ;
  }
}

class Init {
  Init._();

  static final instance = Init._();
  Future initialize() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}