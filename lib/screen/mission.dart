import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Mission extends StatefulWidget {
  const Mission({Key? key}) : super(key: key);

  @override
  State<Mission> createState() => _MissionState();
}

class _MissionState extends State<Mission> {
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
              child: const Text("GAC is a worldwide service provider dedicated to building long-term relationships with customers,staff and suppliers. We are committed to delivering integrated service to the Shipping, Logistics, Marine and related markets at the highest levels of quality and safety."
              ,style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,height: 1.5),)
          )

        ],
      ),
    );
  }
}
