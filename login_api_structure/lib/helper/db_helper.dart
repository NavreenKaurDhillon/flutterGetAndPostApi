import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_api_structure/helper/preferences.dart';

import '../models/login_model.dart';

class DbHelper{
static GetStorage box = GetStorage();
static const JsonDecoder _decoder = JsonDecoder();
static const JsonEncoder _encoder = JsonEncoder.withIndent('  ');

static void saveUserModel(LoginModel? model) {
if (model != null) {
  debugPrint("===Saving user: $model");
String value = _encoder.convert(model);
box.write(Preferences.userData, value);
} else {
box.write(Preferences.userData, null);
}
}

static LoginModel? getUserModel() {
String? user = box.read(Preferences.userData);
if (user != null) {
Map<String, dynamic>  userMap = _decoder.convert(user);
return LoginModel.fromJson(userMap);
} else {
return null;
}
}

static Future<void> saveUserType(String userType) async {
await box.write(Preferences.userType, userType);
}

static String? getUserType() {
final userType = box.read(Preferences.userType);
return userType;
}

static Future<void> saveUserLogin(bool value) async {
await box.write(Preferences.userLogin, value);
}

static bool? getUserLogin() {
final userType = box.read(Preferences.userLogin);
return userType;
}

static Future<void> saveCredential(LoginModel model) async {
final jsonData = jsonEncode(model.toJson());
await box.write(Preferences.credential, jsonData);
}

static LoginModel? getCredential() {
final credential = box.read(Preferences.credential);
if (credential != null) {
final Map<String, dynamic> data = jsonDecode(credential as String);
return LoginModel.fromJson(data);
}
/*else{
    return UserBody();
  }*/
}

static Future<void> saveToken(String token) async {
await box.write(Preferences.authToken, token);
}

static String? getToken() {
final token = box.read(Preferences.authToken);
return token;
}

static deleteData(String key) async {
await box.remove(key);
}

static eraseData() async {
await box.erase();
}

// /// Device Token
// static Future<void> saveFcmToken(String fcmToken) async {
//   await box.write('fcmToken', fcmToken);
// }

// static String? getFcmToken() {
//   final fcm = box.read('fcmToken');
//   return fcm;
// }


// static Future<void> saveUserLogin(String userType) async {
//   await box.write('userLogin', userType);
// }

// static String? getIsUserLogin() {
//   final userLogin = box.read('userLogin');
//   return userLogin;
// }
}

