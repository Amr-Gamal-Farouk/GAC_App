class URL {
  static const String BASE_URL_1 = "http://authapi.gacegy.com/api/";
  static const String BASE_URL_2 = "http://directoryapi.gacegy.com/Contacts/";

  //-------------------------- API endpoints ---------------------------------


  // static String kGetProductDetails(id) => kGetAllProducts + '/$id';


  static String KGetAllEmploys()=> "GetEmployeeData";
  static String KGetEmploysDetails({required String code})=> "GetContactData?Code=$code";
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
