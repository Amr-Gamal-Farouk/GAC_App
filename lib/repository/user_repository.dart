


import 'package:gac/data_provider/model/employ_model.dart';
import 'package:gac/data_provider/model/login_model.dart';
import 'package:gac/data_provider/model/response_model.dart';
import 'package:gac/data_provider/model/user_model.dart';
import 'package:gac/data_provider/services/user_service.dart';

class UserRepository {
  UserRepository._();

  static final _instance = UserRepository._();

  factory UserRepository() {
    return _instance;
  }

  Future<ResponseModel<LoginModel>> login({required String userName, required String pass}) async{
    return UserService.login(userName: userName, pass: pass);
  }
Future<ResponseModel> logout({required String token}) async{
    print("!!! ${UserService.logout(token: token)}");
    return UserService.logout(token: token);
  }

  Future<ResponseModel<List<EmployModel>>> getEmploys({required String token}) async{
     return UserService.getEmploys(token: token);
  }

  Future<ResponseModel<UserModel>> getEmployDetails({required String userId,required String token}) async {
    return  UserService.getEmployDetails(userId: userId,token: token);
  }
}