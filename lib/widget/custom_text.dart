
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String title;
  String value;
  CustomText({Key? key,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical:8 ),
      child: Row(
        children: [
          Text(title,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black45,fontStyle: FontStyle.italic,)),
          SizedBox(width: 28,),
          Text(value,style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45,fontStyle: FontStyle.italic,)),

        ],
      ),
    );
  }
}
