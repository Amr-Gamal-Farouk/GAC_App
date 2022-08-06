
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gac/data_provider/model/employ_model.dart';
import 'package:gac/data_provider/model/login_model.dart';
import 'package:gac/data_provider/model/response_model.dart';
import 'package:gac/data_provider/model/user_model.dart';
import 'package:gac/repository/user_repository.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:shared_preferences/shared_preferences.dart';




class UserProvider extends ChangeNotifier{

  UserRepository userRepository=UserRepository();
  List<EmployModel> allEmploy=[];
  List<EmployModel> employeeSearchList=[];
  List<EmployModel> favoriteEmployees=[];
  List<Contact> contactList=[];
  LoginModel? currentUser;
   UserModel? selectedUser;
  int? errorCode;






  Future<bool> loginAction({required String userName, required String pass}) async{

    final prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('token');

      try{
        ResponseModel<LoginModel> userResponseModel =await userRepository.login(userName: userName,pass: pass);
        // print (userResponseModel);
        if(userResponseModel.isSuccess){
          print("QQ>> ${userResponseModel.responseData}");
          currentUser=userResponseModel.responseData!;
          getContact();

          String data=jsonEncode(currentUser);
          await prefs.setString('token', data);

          notifyListeners();
          return true;
        }else{
          print("ERROR => ${userResponseModel.errorModel?.errorCode} : ${userResponseModel.errorModel?.errorMessage}");
          errorCode= userResponseModel.errorModel?.errorCode;
          notifyListeners();
          return false;
        }

      }catch(e){
        print("EX>> $e");
        // rethrow;
        notifyListeners();
        return false;
      }

  }


  Future<bool> getEmploys({required String token}) async{

    final prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('employeeList');

    if(action!=null){
      List<EmployModel> _list=employModelFromJson(action);
      allEmploy=_list;
      employeeSearchList=_list;
    }



    try{
      ResponseModel<List<EmployModel>> userResponseModel =await userRepository.getEmploys(token: token);
      // print (userResponseModel);
      if(userResponseModel.isSuccess){
        print("QQ>> ${userResponseModel.responseData}");
        allEmploy=userResponseModel.responseData!;
        employeeSearchList=userResponseModel.responseData!;
        getContact();

        String data=jsonEncode(allEmploy);
        await prefs.setString('employeeList', data);

        notifyListeners();
        return true;
      }else{
       print("ERROR => ${userResponseModel.errorModel?.errorCode} : ${userResponseModel.errorModel?.errorMessage}");
       errorCode= userResponseModel.errorModel?.errorCode;
       notifyListeners();
        return false;
      }

    }catch(e){
      print("EX>> $e");
      rethrow;
      notifyListeners();
      return false;
    }

  }
  Future<bool> getEmployDetails({required String userId,required String token}) async{
    try{
      ResponseModel<UserModel> userResponseModel =await userRepository.getEmployDetails(userId: userId,token: token );
      if(userResponseModel.isSuccess){
        selectedUser=userResponseModel.responseData!;
        print ("Selected Employee>> $selectedUser");

        notifyListeners();
        return true;
      }else{
       print("ERROR => ${userResponseModel.errorModel?.errorCode} : ${userResponseModel.errorModel?.errorMessage}");
       errorCode= userResponseModel.errorModel?.errorCode;
       notifyListeners();
        return false;
      }

    }catch(e){
      notifyListeners();
      return false;
    }

  }

  favoriteAction({required EmployModel employModel}){
    if (isFavorite(employModel: employModel)){
      favoriteEmployees.remove(employModel);
      notifyListeners();
    }else{
    favoriteEmployees.add(employModel);
    notifyListeners();
    }

  }

  bool isFavorite ({required EmployModel employModel}){
    return favoriteEmployees.contains(employModel);
  }


  searchAction({required String searchKey, int? value}){
    employeeSearchList=[];
    for(int i=0; i<allEmploy.length;i++){
      if(value==1) {
        if (allEmploy[i]
            .name
            .toLowerCase()
            .contains(searchKey.toLowerCase())) {
          employeeSearchList.add(allEmploy[i]);
        }
      }
      else if(value==2) {
        if (allEmploy[i]
            .company
            .toLowerCase()
            .contains(searchKey.toLowerCase())) {
          employeeSearchList.add(allEmploy[i]);
        }
      }
      else if(value==3) {
        if (allEmploy[i]
            .department
            .toLowerCase()
            .contains(searchKey.toLowerCase())) {
          employeeSearchList.add(allEmploy[i]);
        }
      }
    }

    notifyListeners();
  }


  resetSearch(){
    employeeSearchList=allEmploy;
    notifyListeners();
  }

  getContact() async{
    if (await FlutterContacts.requestPermission()) {
      // Get all contacts (lightly fetched)
      List<Contact> contacts = await FlutterContacts.getContacts();

      // Get all contacts (fully fetched)
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      contactList=contacts;
      print("<><<><>$contacts");
      notifyListeners();
    }



  }

  addToContacts({required String firstName,required String lastName,required String phoneNum})async{
    if (await FlutterContacts.requestPermission()) {
      final newContact = Contact()
        ..name.first = firstName
        ..name.last = lastName
        ..phones = [Phone(phoneNum)];
      await newContact.insert();

      print("done amr");

    }
    }

    }


