
import 'package:flutter/material.dart';

class DetailsBlock extends StatefulWidget {
  Icon icon;
  String text;
  var action;
  Widget customWidget;

  DetailsBlock({Key? key,required this.text,this.action,required this.icon,required this.customWidget}) : super(key: key);

  @override
  State<DetailsBlock> createState() => _DetailsBlockState(text: text,
  icon: icon,action: action,customWidget: customWidget);
}

class _DetailsBlockState extends State<DetailsBlock> {
  Icon icon;
  String text;
  var action;
  Widget customWidget;

  _DetailsBlockState({Key? key,required this.text,this.action,required this.icon,required this.customWidget});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding:const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
        margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 4),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(12)

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 4),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: icon,


                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),

              ],
            ),
            (customWidget==null)?Container():customWidget
          ],
        ),
      ),
      onTap: action,
    );
  }
}
