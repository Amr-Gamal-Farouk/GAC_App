import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gac/data_provider/model/employ_model.dart';
import 'package:gac/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

import '../widget/detils_block.dart';

class DetailsScreen extends StatefulWidget {
  EmployModel employee;
   DetailsScreen({Key? key,required this.employee}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {


  bool isLoading = false;
  late UserProvider _userState;
  bool phoneExpand=false;


  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    _userState = Provider.of<UserProvider>(context, listen: false);
    getData();

    super.initState();
  }
  getData()async{
    await _userState.getEmployDetails(userId: widget.employee.code.toString(),token: _userState.currentUser!.token);
    setState(() {
      isLoading = false;
    });
  }


  pageView(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(

            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.indigo,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("Contacts",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),),
                        )
                      ],
                    ),
                  ),
                  Consumer <UserProvider>(
                    builder: (context, provider, child) {
                      return (isLoading)
                          ?  const Center(
                        child: CircularProgressIndicator(),
                      )
                          :Stack(
                        children: [
                          Container(
                            height: 100,
                            decoration: const BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                          ),

                          Column(
                            children: [
                              Container(
                                height: 35,
                                color: Colors.indigo,
                              ),
                              SingleChildScrollView(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 60.0),
                                        child: Text(
                                          provider.selectedUser!.name.toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 22),
                                        ),
                                      ),
                                      Text(
                                        "${provider.selectedUser!.department} (${provider.selectedUser!.branch})",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontWeight: FontWeight.w300,
                                            fontSize: 16),),

                                      const SizedBox(height: 10,),


                                      DetailsBlock(text: provider.selectedUser!.personalEmail,
                                          icon:Icon(Icons.email,color: Colors.white,), action: () async{
                                            final Email email = Email(
                                              body: "",
                                              subject: "",
                                              recipients: [provider.selectedUser!.personalEmail],
                                              attachmentPaths: [],
                                              isHTML: false,
                                            );
                                            await FlutterEmailSender.send(email);
                                          },
                                          customWidget: Container()),

                                      DetailsBlock(text: provider.selectedUser!.mobile1,
                                          icon:Icon(Icons.phone_android,color: Colors.white,),
                                          action: () async{
                                            final Uri launchUri = Uri(
                                              scheme: 'tel',
                                              path: provider.selectedUser!.mobile1,
                                            );
                                            await launchUrl(launchUri);

                                          },customWidget: IconButton(
                                            icon: Icon(Icons.whatsapp,color: Colors.green),
                                            onPressed: () async{
                                              var whatsappURl_android = "whatsapp://send?phone=+20${provider.selectedUser!.mobile1}&text=hello";
                                              // var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";

                                              if( await canLaunchUrl(Uri.parse(whatsappURl_android))){
                                                await launchUrl(Uri.parse(whatsappURl_android));
                                              }else{
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(content: new Text("whatsapp no installed")));
                                              }
                                            },
                                          )),

                                      // DetailsBlock(text: provider.selectedUser!.empPri,
                                      //     icon:Icon(Icons.call,color: Colors.white,),
                                      //     action: () async{
                                      //       final Uri launchUri = Uri(
                                      //         scheme: 'tel',
                                      //         path: provider.selectedUser!.empPri,
                                      //       );
                                      //       await launchUrl(launchUri);
                                      //
                                      //     },customWidget: Container()),

                                      DetailsBlock(text: provider.selectedUser!.extension,
                                          icon:Icon(Icons.numbers,color: Colors.white,),
                                          action: (){},customWidget: Container()),

                                      DetailsBlock(text: provider.selectedUser!.company,
                                          icon:Icon(Icons.apartment_outlined,color: Colors.white,),
                                          action: (){},customWidget: Container()),

                                      DetailsBlock(text: provider.selectedUser!.branch,
                                          icon:Icon(Icons.store_mall_directory,color: Colors.white,),
                                          action: (){},customWidget: Container()),

                                      InkWell(
                                        child: Container(
                                          padding:const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                                          margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 4),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.grey.withOpacity(0.2)),
                                              borderRadius: BorderRadius.circular(12),
                                              color: Colors.indigo

                                          ),
                                          child: const Text(
                                            "ADD TO CONTACTS",style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        onTap: () async{
                                          String name=provider.selectedUser!.name;
                                          List idx = name.split(" ");
                                          print(idx);
                                          await _userState.addToContacts(firstName: idx[0] ,lastName:(idx.length>=2)?idx[1]:provider.selectedUser!.company ,phoneNum:provider.selectedUser!.mobile1);

                                          showTopSnackBar(
                                            context,
                                            CustomSnackBar.success(
                                                message:
                                                "User added to contacts successfully!"
                                            ),
                                          );

                                        },
                                      )





                                    ],
                                  ),

                                ),
                              ),
                            ],
                          ),
                          Positioned(
                              top: 1,
                              left: (MediaQuery.of(context).size.width*0.5)-37.5,
                              child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    // border: Border.all(color: Colors.indigo,width: 1),
                                    image: DecorationImage(image: MemoryImage(base64Decode(provider.selectedUser!.photo.split(',').last))),)
                              ),

                          ),
                          Positioned(
                              top: 50,
                              right: 30,
                              child: Container(

                                child: InkWell(
                                  child: Container(
                                    width: 27,
                                    height: 27,
                                    child: Provider.of<UserProvider>(context, listen: true).isFavorite(employModel: widget.employee)?
                                    const Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Icon(Icons.favorite_outlined,color: Colors.indigo),
                                    ):
                                    Stack(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: Icon(Icons.favorite_border,color: Colors.indigo),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 12),
                                          child: Icon(Icons.add,size: 20,color: Colors.yellow),
                                        ),

                                      ],
                                    ),

                                  ),
                                  onTap: (){
                                    Provider.of<UserProvider>(context, listen: false).favoriteAction(employModel: widget.employee);
                                  },
                                ),
                              ))

                        ],
                      ) ;
                    },
                  ),

                ],
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return pageView(context);
  }
}
