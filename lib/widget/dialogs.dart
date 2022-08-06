
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:gac/data_provider/model/employ_model.dart';
import 'package:gac/screen/employee_details.dart';



Future<dynamic> showDialogNotInternet({required BuildContext context}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => FlipInX(
        child: CupertinoAlertDialog(
          title: Center(
            child: Row(
              children: const <Widget>[
                Icon(
                  Icons.warning,
                ),
                Text("  Internet issue"),
              ],
            ),
          ),
          content: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text("Please checking internet connection!"),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  AppSettings.openWIFISettings();
                },
                child: const Text("Setting",style: TextStyle(color: Colors.teal)))
          ],
        ),
      ));
}

Future<dynamic> showAlertDialog({required BuildContext context,required String content}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) =>  FlipInX(
        child: CupertinoAlertDialog(
          title: Center(
            child: Row(
              children: const <Widget>[
                Icon(
                  Icons.warning,
                ),
                Text("Alert"),
              ],
            ),
          ),
          content:  Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(content),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK",style: TextStyle(color: Colors.teal)))
          ],
        ),
      ));
}


// Future<dynamic> showDetailsDialog({required BuildContext context,required EmployModel employModel}) {
//   return showAnimatedDialog(
//     context: context,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(child: EmployeeDetails(employee: employModel)),
//       );
//     },
//     animationType: DialogTransitionType.size,
//     curve: Curves.fastOutSlowIn,
//     duration: Duration(seconds: 1),
//   );
// }