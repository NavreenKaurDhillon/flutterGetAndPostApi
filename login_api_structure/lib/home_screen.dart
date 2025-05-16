
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_api_structure/app_colors/app_colors.dart';
import 'package:login_api_structure/controllers/home_controller.dart';
import 'package:login_api_structure/login_screen.dart';
import 'package:login_api_structure/quotes_list_screen.dart';

class HomeScreen extends StatelessWidget{
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              Row(
                children: [
                  const Text("User name:",style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.w400),),
                 Obx(()=> Text(controller.userName.value, style: const TextStyle(color: AppColors.orangeColor, fontWeight: FontWeight.w400),))
                  ]),
              Row(
                    children: [
                      const Text("User email:",style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.w400),),
                     Obx(()=> Text(controller.email.value, style: const TextStyle(color: AppColors.orangeColor, fontWeight: FontWeight.w400),) ) ,
                    ],
                  ),
              Row(
                    children: [
                      const Text("Password:",style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.w400),),
                      Obx(()=>Text(controller.password.value, style: const TextStyle(color: AppColors.orangeColor, fontWeight: FontWeight.w400),))
                    ],
                  ),
              SizedBox(height: 80,),
              ElevatedButton(onPressed: (){
                //move to home screen
                debugPrint("pressed login");
                Get.to(() => QuotesListScreen());
              }, style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors.orangeColor),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
              ),
                  child: const Text("Get Quotes", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),))
                ],
              ),
          ),
      )
    );
  }

}