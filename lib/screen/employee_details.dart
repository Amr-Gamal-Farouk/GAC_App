// import 'package:flutter/material.dart';
// import 'package:gac/data_provider/model/employ_model.dart';
// import 'package:gac/provider/user_provider.dart';
// import 'package:provider/provider.dart';
//
// class EmployeeDetails extends StatefulWidget {
//   EmployModel employee;
//    EmployeeDetails({Key? key,required this.employee}) : super(key: key);
//
//   @override
//   State<EmployeeDetails> createState() => _EmployeeDetailsState();
// }
//
// class _EmployeeDetailsState extends State<EmployeeDetails> {
//
//   bool isLoading = false;
//   late UserProvider _userState;
//
//
//   @override
//   void initState() {
//     setState(() {
//       isLoading = true;
//     });
//     _userState = Provider.of<UserProvider>(context, listen: false);
//     getData();
//
//     super.initState();
//   }
//   getData()async{
//     await _userState.getEmployDetails(userId: widget.employee.empId.toString());
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<UserProvider>(
//   builder: (context, provider, child) {
//   return (isLoading)
//       ? const Material(
//         child: Center(
//     child: CircularProgressIndicator(),
//   ),
//       )
//       : Material(
//         child:  Container(
//       height: 135,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: Colors.grey.withOpacity(0.4)),
//         ),
//         child: Column(
//           children: [
//             ListTile(
//               onTap: () => print("tap"),
//               dense: true,
//               leading: Icon(
//                 Icons.person,
//                 size: 30,
//                 color: Theme.of(context).primaryColor,
//               ),
//               title: Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Text(
//                     provider.selectedUser!.empFullName.toString(),
//                     textAlign: TextAlign.start,
//                   )),
//               subtitle: Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Text(
//                       "${provider.selectedUser!.departmentName} (${provider.selectedUser!.branchName})")),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 70),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.alternate_email,
//                     color: Colors.grey.withOpacity(0.8),
//                     size: 15,
//                   ),
//                   SizedBox(
//                     width: 3,
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width / 2,
//                     child: Text(
//                       provider.selectedUser!.empIndividualEmail0,
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey.withOpacity(0.8)),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: 70, vertical: 8),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.phone_iphone,
//                     color: Colors.grey.withOpacity(0.8),
//                     size: 15,
//                   ),
//                   SizedBox(
//                     width: 3,
//                   ),
//                   Text(
//                     provider.selectedUser!.empMobile0.toString(),
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey.withOpacity(0.8)),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//     ),
//
//       );
//   },
// );
//   }
// }
