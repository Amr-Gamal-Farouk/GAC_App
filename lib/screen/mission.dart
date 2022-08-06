import 'package:flutter/material.dart';

class Mission extends StatefulWidget {
  const Mission({Key? key}) : super(key: key);

  @override
  State<Mission> createState() => _MissionState();
}

class _MissionState extends State<Mission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigo,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.contain,
                    ),
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

            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text("GAC is a worldwide service provider dedicated to building long-term relationships with customers,staff and suppliers. We are committed to delivering integrated service to the Shipping, Logistics, Marine and related markets at the highest levels of quality and safety.")
            )
          ],
        ),
      ),
    );
  }
}
