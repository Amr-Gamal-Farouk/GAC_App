
import 'package:flutter/material.dart';

class CustomIconText extends StatelessWidget {
  var tapAction;
  IconData icon;
  String text;
   CustomIconText({Key? key,required this.text,required this.icon,this.tapAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapAction,
      child: Padding(
        padding:  const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(icon,color: Colors.white,),
            SizedBox(width: 28,),
    Text(text,style: TextStyle(fontWeight: FontWeight.w800,
    color: Colors.white,))
          ],
        ),
      ),

    );
  }
}
