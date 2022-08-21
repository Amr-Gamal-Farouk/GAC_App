class URL {
  static const String BASE_URL_1 = "http://authapi.gacegy.com/";
  static const String BASE_URL_2 = "http://directoryapi.gacegy.com/";

  //-------------------------- API endpoints ---------------------------------


  // static String kGetProductDetails(id) => kGetAllProducts + '/$id';


  static String KGetAllEmploys()=> "Contacts/GetEmployeeData";
  static String KGetEmploysDetails({required String code})=> "Contacts/GetContactData?Code=$code";
  static String KGetCurrentUser()=> "api/user";
  static String KGetCurrentUserLogged()=> "Employee/GetLoggedUserData";
  static String KLeaveBalance({required String code})=> "Employee/GetLeaveBalance?Code=$code";
  static String KDepartmentChart({required String code})=> "Employee/GetDepartmentChart?Code=$code";
  static String KPublicHolidays()=> "Portal/GetPublicHolidays";
  static String KLogin()=> "api/login";
  static String KLogout()=> "api/logout";

  static String getURL({String? functionName,required int baseUrl}) {
    if(baseUrl==1){
    return BASE_URL_1 + functionName!;
    }else{
      return BASE_URL_2 + functionName!;
    }
  }
}
