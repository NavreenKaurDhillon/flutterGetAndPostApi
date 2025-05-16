
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:login_api_structure/models/login_model.dart';
import 'package:login_api_structure/networking/api_provider.dart';
import 'package:login_api_structure/widget/constants.dart';

import '../helper/db_helper.dart';
import '../home_screen.dart';

class LoginController extends GetxController {
  RxBool loader = false.obs;

  TextEditingController emailController =TextEditingController();
 TextEditingController passwordController =TextEditingController();

 String loginValidation() {
   if (emailController.text.isEmpty) {
     return Constants.emailEmpty;
   }else if (passwordController.text.isEmpty) {
     return Constants.passwordEmpty;
   }
   return Constants.success;
 }
Future<void> postApi(Map<String, dynamic> map) async{
var response = await ApiProvider().postApi(map);
debugPrint("==== login response =  $response");
if(response.code == 200){
  DbHelper.saveUserLogin(true);
  DbHelper.saveUserModel(LoginModel());
  debugPrint("==== login response =  $response");
  debugPrint("==== login response model = ${LoginModel().email}");
  // DbHelper.saveUserType(loginResponse.body?.role == 1 ? AppString.customer : loginResponse.body?.role == 2 ? AppString.artwork : AppString.printing);
  Fluttertoast.showToast(
    msg:"Logged in succesfully",
    toastLength: Toast.LENGTH_SHORT, // or Toast.LENGTH_LONG
    gravity: ToastGravity.BOTTOM, // or ToastGravity.TOP, ToastGravity.CENTER, etc.
    timeInSecForIosWeb: 1, // iOS/Web specific duration
    backgroundColor: Colors.grey[600],
    textColor: Colors.white,
    fontSize: 16.0,
  );
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Get.to(() => HomeScreen());
  });
}
}
}