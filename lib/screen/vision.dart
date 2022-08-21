import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Vision extends StatefulWidget {
  const Vision({Key? key}) : super(key: key);

  @override
  State<Vision> createState() => _VisionState();
}

class _VisionState extends State<Vision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.30,
            decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(100),
                bottomLeft: Radius.circular(100)),
                gradient:  LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    // Colors.indigoAccent,
                    Colors.indigo
                  ],
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                ),
              ],
            ),
          ),

          Container(
              margin: const EdgeInsets.symmetric(vertical: 35,horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(10),
              // ),
              child: const Text("To provide leadership and innovation in global business and community life by delivering a flexible portfolio of services built on quality, safety, honesty, vigour and a commitment to long term business relationships."
                ,style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,height: 1.5),)
          )

        ],
      ),
    );
  }
}

