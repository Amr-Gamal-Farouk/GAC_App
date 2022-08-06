import 'package:flutter/material.dart';

class Vision extends StatefulWidget {
  const Vision({Key? key}) : super(key: key);

  @override
  State<Vision> createState() => _VisionState();
}

class _VisionState extends State<Vision> {
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
              child: const Text("To provide leadership and innovation in global business and community life by delivering a flexible portfolio of services built on quality, safety, honesty, vigour and a commitment to long term business relationships."),
            )


          ],
        ),
      ),
    );
  }
}
