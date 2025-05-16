
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_api_structure/widget/constants.dart';
import 'app_colors/app_colors.dart';
import 'controllers/login_controller.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget{
  LoginScreen({super.key});
  LoginController controller = Get.put(LoginController());
//priya@yopmail.com, 123456
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login", style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           /* ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  Assets.imagesFacebook,
                  height: 45,
                  width: 45,
                  fit: BoxFit.fill,))*/
            const Text("Email",
            style: TextStyle(
              color: Colors.black,
                fontWeight: FontWeight.bold
            ),
            ),
            TextFormField(
              controller: controller.emailController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelStyle: TextStyle(fontWeight: FontWeight.w400,
                  fontSize: 14,),
                labelText: "Enter email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),),
                fillColor: AppColors.orangeColor,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never
              ),
            ),
            const SizedBox(height: 20,),
            const Text("Password",
            style: TextStyle(
                color: Colors.black,
              fontWeight: FontWeight.bold
            ),),
            TextFormField(
                controller: controller.passwordController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300
                  ),
              labelText: "Enter password",
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                    fillColor: AppColors.orangeColor,
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never
                ),
            ),
            const SizedBox(height: 100,),
            ElevatedButton(onPressed: (){
              //move to home screen
              hitLoginApi();
            }, style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(AppColors.orangeColor),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
            ),
                child: const Text("Login", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),)),
          ],
        ),
      ),
    );
  }

  void hitLoginApi() {
    String result = controller.loginValidation();

    if (result == Constants.success) {
      debugPrint("===validation result $result");
      controller.loader.value = true;
      Map<String, dynamic> map = {
        "email": controller.emailController.text,
        "password": controller.passwordController.text,
        "device_type": 1,
        "device_token": "jhbjhb"
      };
     controller.postApi(map);
    }
    else{
      debugPrint("===validation result error  $result");
      Fluttertoast.showToast(
        msg:result,
        toastLength: Toast.LENGTH_SHORT, // or Toast.LENGTH_LONG
        gravity: ToastGravity.BOTTOM, // or ToastGravity.TOP, ToastGravity.CENTER, etc.
        timeInSecForIosWeb: 1, // iOS/Web specific duration
        backgroundColor: Colors.grey[600],
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

}