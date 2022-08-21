
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late UserProvider _userProvider;



  design(){
    return Container(
      color: Colors.white,
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              // Positioned(
              //     top: 100,
              //     child:
                  FadeInLeft(
                    duration: Duration(seconds: 1),
                    child: const Divider(
                      height: 2,
                      thickness: 5,
                      color: Colors.indigo,
                    endIndent: 8,
                    indent: 8,
                    // ),
                  )),
                const SizedBox(
                  height: 100,
                ),

                // Positioned(
                //     top: 200,
                //     child:
                    FadeInRight(
                        duration: const Duration(seconds: 1),
                        child: const Divider(
                        height: 2,
                        thickness: 5,
                        color: Colors.yellow,
                          endIndent: 8,
                          indent: 8,
                      // ),
                    )),

            ],
          ),
          Row(
            // textDirection: TextDirection.rtl,
            children: [
              Padding(padding: EdgeInsets.only(left: 55)),
              FadeInDown(
                child: VerticalDivider(
                  width: 2,
                  thickness: 5,
                  color: Colors.indigo,
                  endIndent: 77,
                  indent: 77,
                ),
              )
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElasticIn(
                  duration: const Duration(seconds: 2),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                      )
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _userProvider=Provider.of<UserProvider>(context,listen: false);
    _userProvider.splashAction();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: design(),
    );
  }
}
