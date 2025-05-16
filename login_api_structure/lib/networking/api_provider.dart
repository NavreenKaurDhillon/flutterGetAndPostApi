
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_api_structure/models/quotes_list_model.dart';
import 'package:login_api_structure/models/quotes_single_model.dart';
import 'package:login_api_structure/widget/constants.dart';

import '../models/login_model.dart';
import '../shared/data_response.dart';
import 'injector.dart';

class ApiProvider{
  late Dio _dio;

  ApiProvider() {
    _dio = Injector().getDio();
  }
  static Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<dynamic> getObjectApi() async{
    try{
      bool isOnline = await hasNetwork();
      if(!isOnline){
        Fluttertoast.showToast(
          msg:Constants.appName,
          toastLength: Toast.LENGTH_SHORT, // or Toast.LENGTH_LONG
          gravity: ToastGravity.BOTTOM, // or ToastGravity.TOP, ToastGravity.CENTER, etc.
          timeInSecForIosWeb: 1, // iOS/Web specific duration
          backgroundColor: Colors.grey[600],
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }
      Response response = await _dio.get(Constants.getQuotesObject);
      // final dataResponse =jsonDecode(response.data);
      final dataResponse = QuotesSingleModel.fromJson(response.data);
      // debugPrint("===okhttp  GET response : $response");
      // debugPrint("===okhttp  GET dataResponse : $dataResponse");
      return dataResponse;
    }
    on DioException catch(e){
      debugPrint("===okhttp  GET error : ${e.response}");
      return DataResponse(message: e.response?.data[Constants.message]);
    }
  }

  Future<dynamic> getListApi() async{
    try{
      bool isOnline = await hasNetwork();
      if(!isOnline){
        Fluttertoast.showToast(
          msg:Constants.appName,
          toastLength: Toast.LENGTH_SHORT, // or Toast.LENGTH_LONG
          gravity: ToastGravity.BOTTOM, // or ToastGravity.TOP, ToastGravity.CENTER, etc.
          timeInSecForIosWeb: 1, // iOS/Web specific duration
          backgroundColor: Colors.grey[600],
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }
      Response response = await _dio.get(Constants.getQuotes);
      List<dynamic> data = response.data;
      final dataResponse = data.map((e) => QuotesListModel.fromJson(e)).toList();
      debugPrint("===okhttp  GET quote response : $response");
      debugPrint("===okhttp  GET quote dataResponse : $dataResponse");
      return dataResponse;
    }
    on DioException catch(e){
      debugPrint("===okhttp  GET error : ${e.response}");
      return DataResponse(message: e.response?.data[Constants.message]);
    }
  }

  //login
  Future<dynamic> postApi(Map<String, dynamic> data) async {
    try {
      bool isOnline = await hasNetwork();
      if (!isOnline) {
        Fluttertoast.showToast(
          msg:Constants.appName,
          toastLength: Toast.LENGTH_SHORT, // or Toast.LENGTH_LONG
          gravity: ToastGravity.BOTTOM, // or ToastGravity.TOP, ToastGravity.CENTER, etc.
          timeInSecForIosWeb: 1, // iOS/Web specific duration
          backgroundColor: Colors.grey[600],
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }
      // Map<String, dynamic> data = request.toJson();
      Response response = await _dio.post(Constants.login,options: Injector.getHeaderToken(), data: FormData.fromMap(data));
      var dataResponse = DataResponse<LoginModel>.fromJson(response.data, (data) => LoginModel.fromJson(data as Map<String, dynamic>));
      debugPrint("===okhttp  POST response : $response");
      return dataResponse;
    } on DioException catch (e) {
      debugPrint("===okhttp  POST error : ${e.response}");
      return DataResponse(message: e.response?.data[Constants.message]);
    }
  }
}