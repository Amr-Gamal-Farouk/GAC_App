import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioWidget extends StatefulWidget {
  int value;
  int? groupValue;
  var action;
  String text;
   RadioWidget({Key? key,required this.value, this.groupValue,required this.text,this.action}) : super(key: key);

  @override
  State<RadioWidget> createState() => _RadioWidgetState(value: value,groupValue: groupValue,text: text,action: action);
}

class _RadioWidgetState extends State<RadioWidget> {
  int value;
  int? groupValue;
  var action;
  String text;
  _RadioWidgetState({Key? key,required this.value, this.groupValue,required this.text,this.action});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<int>(
            activeColor: Colors.white,
            value: value,
            groupValue: groupValue,
            onChanged: action
        ),
        const SizedBox(width: 2,),
        Text(text,style: const TextStyle(color: Colors.white),)


      ],
    );
  }
}
