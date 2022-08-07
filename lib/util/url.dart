class URL {
  static const String BASE_URL_1 = "http://authapi.gacegy.com/api/";
  static const String BASE_URL_2 = "http://directoryapi.gacegy.com/";

  //-------------------------- API endpoints ---------------------------------


  // static String kGetProductDetails(id) => kGetAllProducts + '/$id';


  static String KGetAllEmploys()=> "Contacts/GetEmployeeData";
  static String KGetEmploysDetails({required String code})=> "Contacts/GetContactData?Code=$code";
  static String KGetCurrentUser()=> "Employee/GetLoggedUserData";
  static String KLogin()=> "login";
  static String KLogout()=> "logout";

  static String getURL({String? functionName,required int baseUrl}) {
    if(baseUrl==1){
    return BASE_URL_1 + functionName!;
    }else{
      return BASE_URL_2 + functionName!;
    }
  }
}
