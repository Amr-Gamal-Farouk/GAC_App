import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gac/provider/user_provider.dart';
import 'package:gac/widget/custom_text.dart';
import 'package:provider/provider.dart';

class LeaveBalanceScreen extends StatefulWidget {
  const LeaveBalanceScreen({Key? key}) : super(key: key);

  @override
  State<LeaveBalanceScreen> createState() => _LeaveBalanceScreenState();
}

class _LeaveBalanceScreenState extends State<LeaveBalanceScreen> {
  bool isLoading=true;
  late UserProvider _userProvider;
  @override
  void initState() {
    super.initState();
    _userProvider=Provider.of<UserProvider>(context,listen: false);
    getData();

  }
  getData()async{
    await _userProvider.getLeaveBalance(token: _userProvider.currentUser!.token, code: _userProvider.currentLoggedUserData!.code);
    setState(() {
      isLoading= false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<UserProvider>(builder: (context, value, child) {
      return (isLoading)?const Center(child: CircularProgressIndicator(),):Column(
          children: [
      Container(
        height: MediaQuery.of(context).size.height*0.30,
      width: MediaQuery.of(context).size.width,
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
      child:
      Padding(
        padding: const EdgeInsets.only(bottom: 8,top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(right: 8),
                width: 60,
                height: 60,
                decoration:  BoxDecoration(
                  borderRadius:  BorderRadius.circular(50),
                  // border: Border.all(color: Colors.indigo,width: 1),
                  image: DecorationImage(image: MemoryImage(base64Decode(value.currentLoggedUserData!.photo.split(',').last)),
                      fit: BoxFit.contain),)
            ),
            Text(value.currentLoggedUserData!.firstName,style: const TextStyle(fontWeight: FontWeight.w800,
                color: Colors.black45, fontStyle: FontStyle.italic),overflow: TextOverflow.fade) ,
            Text(value.currentLoggedUserData!.jobTitle,style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.white,)) ,
            // (value.currentUserData!.email!="Not Provided")?CustomText(title: "Email:" , value: value.currentUserData!.email.toString()):Container(),
            // (value.currentLoggedUserData!.department!="Not Provided")?CustomText(title: "Department:" , value: value.currentLoggedUserData!.department.toString()):Container(),
            // (value.currentLoggedUserData!.company!="Not Provided")?CustomText(title: "Company:" , value: value.currentLoggedUserData!.company.toString()):Container(),
            // (value.currentLoggedUserData!.branch!="Not Provided")?CustomText(title: "Branch:" , value: value.currentLoggedUserData!.branch.toString()):Container(),



          ],
        ),
      ),
    ),

        Expanded(child: ListView.builder(itemBuilder: (context, index) => itemDesign(index: index),itemCount: value.currentUserLeaves.length,))
        ]);
    },));
  }

  itemDesign({required int index}){
    return Consumer<UserProvider>(builder: (context, value, child) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.withOpacity(0.2),width: 3)
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8,),
            Text(value.currentUserLeaves[index].leaveType,style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontStyle: FontStyle.italic,fontSize: 25)),
          const SizedBox(height: 15,),
            Row(

              children: [
              Expanded(child: CustomText(title: "Year" , value: value.currentUserLeaves[index].year.toString())),
              Expanded(child: CustomText(title: "Total Days" , value: value.currentUserLeaves[index].daysAllowed.toString())),

            ],),
            Row(
              children: [
              Expanded(child: CustomText(title: "Days Used" , value: value.currentUserLeaves[index].daysUsed.toString())),
              Expanded(child: CustomText(title: "Balance" , value: value.currentUserLeaves[index].balance.toString())),
            ],)


          ],
        ),

      );
    },);
  }
}
