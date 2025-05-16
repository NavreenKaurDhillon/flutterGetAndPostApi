

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:login_api_structure/helper/db_helper.dart';

import '../models/login_model.dart';
import '../networking/api_provider.dart';

class HomeController extends GetxController{
  RxString userName =''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;

  initState(){
    setUserData();
  }

  void setUserData(){
    LoginModel? userData = DbHelper.getUserModel();
    if(userData!=null){
      userName.value = userData.name!;
      email.value = userData.email!;
      password.value = userData.password!;
    }

  }

}