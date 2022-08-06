import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gac/provider/user_provider.dart';
import 'package:gac/screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../screen/responsive_layout.dart';
import '../util/validate.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController domainNameCon = TextEditingController();

  TextEditingController passCont = TextEditingController();
  bool notShowPassword = true;
  IconData showPasswordIcon = Icons.remove_red_eye_outlined;

  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormState>();

  late UserProvider _userState;


  void loginAction(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (await _userState.loginAction(userName: domainNameCon.text.trim(), pass: passCont.text.trim())) {
        _btnController.success();
        Timer(Duration(seconds: 1), () {
          _btnController.reset();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ResponsiveLayout(),
              ));
        });
      } else {
        _btnController.error();
        Timer(Duration(seconds: 1), () {
          _btnController.reset();
        });
      }

    } else {
      _btnController.error();
      Timer(Duration(seconds: 1), () {
        _btnController.reset();
      });
    }
  }

  @override
  void initState() {
    domainNameCon = TextEditingController();
    passCont = TextEditingController();
    _userState = Provider.of<UserProvider>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    domainNameCon.dispose();
    passCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 100,
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 20),
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 75,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.height - 125,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.2))),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: Image.asset(
                            "assets/images/logo.png",
                            fit: BoxFit.contain,
                            height: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              hintText: "User Domain",
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor)),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.black54,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Domain can't be empty";
                              }
                            },
                            controller: domainNameCon,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            obscureText: notShowPassword,
                            decoration: InputDecoration(
                              // focusColor: Colors.black,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              hintText: "Password",
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor)),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  showPasswordIcon,
                                  color: Theme.of(context).buttonColor,
                                ),
                                onPressed: () {
                                  if (notShowPassword) {
                                    setState(() {
                                      notShowPassword = false;
                                      showPasswordIcon =
                                          Icons.remove_red_eye_sharp;
                                    });
                                  } else {
                                    setState(() {
                                      notShowPassword = true;
                                      showPasswordIcon =
                                          Icons.remove_red_eye_outlined;
                                    });
                                  }
                                },
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.black54,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "password can't be empty";
                              } else if (value.length < 6) {
                                return "password not less than 6 character";
                              } else {
                                return null;
                              }
                            },
                            controller: passCont,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 30,
                          child: RoundedLoadingButton(
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Theme.of(context).primaryColor,
                            controller: _btnController,
                            onPressed: () => loginAction(context),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // GestureDetector(
                        //   child: Text(
                        //     "Don't Have Account?Create Now!",
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(
                        //         color: Theme.of(context).primaryColor,
                        //         decoration: TextDecoration.underline),
                        //   ),
                        //   onTap: () {
                        //     Provider.of<UserViewModel>(context, listen: false)
                        //         .changeTo(false);
                        //   },
                        // )
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
