



import 'dart:convert';

import 'package:gac/data_provider/model/current_user.dart';
import 'package:gac/data_provider/model/department_chart.dart';
import 'package:gac/data_provider/model/employ_model.dart';
import 'package:gac/data_provider/model/leave_model.dart';
import 'package:gac/data_provider/model/login_model.dart';
import 'package:gac/data_provider/model/public_holidays_model.dart';
import 'package:gac/data_provider/model/response_model.dart';
import 'package:gac/data_provider/model/user_model.dart';
import 'package:gac/util/network_utilities.dart';
import 'package:gac/util/url.dart';

class UserService {
  UserService._();

  // login
  static Future<ResponseModel<LoginModel>> login({required String userName, required String pass}) async {
    Map<String, String> requestHeaders = NetworkUtilities.getHeaders(
        customHeaders: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "<Your token>",

        });


    ResponseModel responseModel = await NetworkUtilities.handlePostRequest(
      acceptJson: true,

        methodURL: '${URL.getURL(functionName: URL.KLogin(),baseUrl: 1)}',
        requestBody: {
          "username": userName,
          "password": pass
        },
        requestHeaders: requestHeaders,
        parserFunction: (userJson) {
          return LoginModel.fromJson(userJson);
        });
    print("<><> ${responseModel.responseData}");

    return ResponseModel(
      responseData: (responseModel.isSuccess)? LoginModel.fromJson(responseModel.responseData):
      null,
      isSuccess: responseModel.isSuccess,
      errorModel: responseModel.errorModel,
    );
  }
// logout
  static Future<ResponseModel> logout({required String token}) async {


    ResponseModel responseModel = await NetworkUtilities.handlePostRequest(
        methodURL: '${URL.getURL(functionName: URL.KLogout(),baseUrl: 1)}',
        requestHeaders: {
          "Authorization": "Bearer $token",
        },
      requestBody: {"logout":"logout"},
        // parserFunction: (userJson) {
        //   return {};
        // },
        );
    print("<><> ${responseModel.responseData}");

    return ResponseModel(
      responseData: (responseModel.isSuccess)? "done":
      null,
      isSuccess: responseModel.isSuccess,
      errorModel: responseModel.errorModel,
    );
  }

  //get all users
  static Future<ResponseModel<List<EmployModel>>> getEmploys({required String token}) async {

    ResponseModel responseModel = await NetworkUtilities.handleGetRequest(

        methodURL: '${URL.getURL(functionName: URL.KGetAllEmploys(),baseUrl:  2)}',
        requestHeaders: {
          "Authorization": "Bearer $token",
        },
        parserFunction: (userJson) {
          return employModelFromJson(userJson);
        });

    print("fffffff > ${responseModel.responseData}");

    return ResponseModel(
      responseData: (responseModel.isSuccess)?responseModel.responseData:
      null,
      isSuccess: responseModel.isSuccess,
      errorModel: responseModel.errorModel,
    );
  }


  //get employ details
  static Future<ResponseModel<UserModel>> getEmployDetails({required String userId,required String token}) async {

    ResponseModel responseModel = await NetworkUtilities.handleGetRequest(

        methodURL: '${URL.getURL(functionName: URL.KGetEmploysDetails(code: userId),baseUrl:  2)}',
         requestHeaders: {
    "Authorization": "Bearer $token",
    },
        parserFunction: (userJson) {
          return UserModel.fromJson(json.decode(userJson)[0]);
        });

    print("11111 ${responseModel.responseData}");

    return ResponseModel<UserModel>(
      responseData: (responseModel.isSuccess)?responseModel.responseData:
      null,
      isSuccess: responseModel.isSuccess,
      errorModel: responseModel.errorModel,
    );
  }

  //get current user
  static Future<ResponseModel<CurrentUserModel>> getCurrentUser({required String token}) async {
    // Map<String, String> requestHeaders = NetworkUtilities.getHeaders(
    //     customHeaders: {
    //       "Content-type": "application/json",
    //       "Accept": "application/json",
    //       "Authorization": "<Your token>"
    //     });

    ResponseModel responseModel = await NetworkUtilities.handleGetRequest(

        methodURL: '${URL.getURL(functionName: URL.KGetCurrentUser(),baseUrl:  1)}',
         requestHeaders: {
    "Authorization": "Bearer $token",
    },
        parserFunction: (userJson) {
          return CurrentUserModel.fromJson(json.decode(userJson));
        });

    print("current user>> ${responseModel.responseData}");

    return ResponseModel<CurrentUserModel>(
      responseData: (responseModel.isSuccess)?responseModel.responseData:
      null,
      isSuccess: responseModel.isSuccess,
      errorModel: responseModel.errorModel,
    );
  }

  static Future<ResponseModel<EmployModel>> getCurrentUserLogged({required String token}) async {
    // Map<String, String> requestHeaders = NetworkUtilities.getHeaders(
    //     customHeaders: {
    //       "Content-type": "application/json",
    //       "Accept": "application/json",
    //       "Authorization": "<Your token>"
    //     });

    ResponseModel responseModel = await NetworkUtilities.handleGetRequest(

        methodURL: '${URL.getURL(functionName: URL.KGetCurrentUserLogged(),baseUrl:  2)}',
         requestHeaders: {
    "Authorization": "Bearer $token",
    },
        parserFunction: (userJson) {
          return EmployModel.fromJson(json.decode(userJson)[0]);
        });

    print("current user>> ${responseModel.responseData}");

    return ResponseModel<EmployModel>(
      responseData: (responseModel.isSuccess)?responseModel.responseData:
      null,
      isSuccess: responseModel.isSuccess,
      errorModel: responseModel.errorModel,
    );
  }

  //todo after come back
  static Future<ResponseModel<List<LeaveModel>>> getLeaveBalance({required String token,required String code}) async {

    ResponseModel responseModel = await NetworkUtilities.handleGetRequest(

        methodURL: '${URL.getURL(functionName: URL.KLeaveBalance(code: code),baseUrl:  2)}',
         requestHeaders: {
    "Authorization": "Bearer $token",
    },
        parserFunction: (userJson) {
          return leaveModelFromJson(userJson);
        });

    print("Leave Balance>> ${responseModel.responseData}");

    return ResponseModel<List<LeaveModel>>(
      responseData: (responseModel.isSuccess)?responseModel.responseData:
      null,
      isSuccess: responseModel.isSuccess,
      errorModel: responseModel.errorModel,
    );
  }

  static Future<ResponseModel<List<PublicHolidaysModel>>> getPublicHolidays({required String token}) async {

    ResponseModel responseModel = await NetworkUtilities.handleGetRequest(

        methodURL: '${URL.getURL(functionName: URL.KPublicHolidays(),baseUrl:  2)}',
         requestHeaders: {
    "Authorization": "Bearer $token",
    },
        parserFunction: (userJson) {
          return publicHolidaysModelFromJson(userJson);
        });

    print("Public Holidays>> ${responseModel.responseData}");

    return ResponseModel<List<PublicHolidaysModel>>(
      responseData: (responseModel.isSuccess)?responseModel.responseData:
      null,
      isSuccess: responseModel.isSuccess,
      errorModel: responseModel.errorModel,
    );
  }

  static Future<ResponseModel<List<DepartmentChartModel>>> getDepartmentChart({required String token,required String code}) async {
    ResponseModel responseModel = await NetworkUtilities.handleGetRequest(

        methodURL: '${URL.getURL(functionName: URL.KDepartmentChart(code: code),baseUrl:  2)}',
         requestHeaders: {
    "Authorization": "Bearer $token",
    },
        parserFunction: (userJson) {
          return departmentChartModelFromJson(json.decode(userJson));
        });

    print("current user>> ${responseModel.responseData}");

    return ResponseModel<List<DepartmentChartModel>>(
      responseData: (responseModel.isSuccess)?responseModel.responseData:
      null,
      isSuccess: responseModel.isSuccess,
      errorModel: responseModel.errorModel,
    );
  }


}