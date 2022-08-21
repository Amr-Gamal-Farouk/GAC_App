import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

class PublicHolidays extends StatefulWidget {
  const PublicHolidays({Key? key}) : super(key: key);

  @override
  State<PublicHolidays> createState() => _PublicHolidaysState();
}

class _PublicHolidaysState extends State<PublicHolidays> {
  final f = DateFormat('dd-MM-yyyy');
  bool isLoading=true;
  late UserProvider _userProvider;
  @override
  void initState() {
    super.initState();
    _userProvider=Provider.of<UserProvider>(context,listen: false);
    getData();

  }
  getData()async{
    await _userProvider.getPublicHolidays(token: _userProvider.currentUser!.token);
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

                Expanded(child: ListView.builder(itemBuilder: (context, index) => itemDesign(index: index),itemCount: value.publicHolidays.length,))
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:10,horizontal: 16 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value.publicHolidays[index].description,style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontStyle: FontStyle.italic,fontSize: 22)),
              const SizedBox(height: 15,),
              Text(f.format(value.publicHolidays[index].date),style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black45,fontStyle: FontStyle.italic,)),



            ],
          ),
        ),

      );
    },);
  }
}
