import 'package:flutter/material.dart';
import 'package:gac/provider/user_provider.dart';
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

  }
  getData()async{
    await _userProvider.getLeaveBalance(token: _userProvider.currentUser!.token, code: _userProvider.currentLoggedUserData!.code);
    setState(() {
      isLoading= false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, value, child) {
      return ListView.builder(itemBuilder: (context, index) => ,itemCount: value.currentUserLeaves.length,);
    },);
  }
}
