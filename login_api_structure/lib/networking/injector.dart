import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_api_structure/widget/constants.dart';

import '../helper/db_helper.dart';

// import '../helper/dbhelper_file.dart';

class Injector{
  static final Injector _singleton = Injector._internal();
  static final _dio = Dio();

  factory Injector() {
    return _singleton;
  }

  Injector._internal(); //injector initialise

  Dio getDio() {
    BaseOptions options = BaseOptions(
      receiveTimeout: const Duration(milliseconds: 18000),
      connectTimeout: const Duration(milliseconds: 18000),
    );

    _dio.options = options;
    _dio.options.followRedirects = false;
    _dio.options.headers["Content-Type"] = "application/json";

    final httpClientAdapter = _dio.httpClientAdapter;
    if (httpClientAdapter is IOHttpClientAdapter) {
      httpClientAdapter.onHttpClientCreate = (HttpClient client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }

    _dio.interceptors.clear();
    _dio.interceptors.add(LoggingInterceptors());

    return _dio;
  }

  static Options? getHeaderToken() {
    String? token = DbHelper.getToken();
    if (token != Constants.empty) {
      debugPrint("token => $token");
      var headerOptions = Options(headers: {'Authorization': '$token',
        'secretkey': 'U2FsdGVkX18cWH+rfiUQiJ0Vn6M8vIfT/2pup77qAzU2mkMfLGJqtGOjoGlfgGRn',
        'publishkey': 'U2FsdGVkX1+iE5oRiAoYXkDa3fkrK3pjpPn27JNc1tkcoPAE+rk3OMJesdQp03bE',
      });
      return headerOptions;
    }
    return null;
  }
}

class LoggingInterceptors extends Interceptor {
  String debugPrintObject(Object object) {
    // Encode your object and then decode your object to Map variable
    Map jsonMapped = json.decode(json.encode(object));
    // Using JsonEncoder for spacing
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    // encode it to string
    String prettyPrint = encoder.convert(jsonMapped);
    return prettyPrint;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("--> ${options.method.toUpperCase()} ${"${options.baseUrl}${options.path}"}");
    debugPrint("Headers:");
    options.headers.forEach((k, v) => debugPrint('$k: $v'));
    debugPrint("queryParameters:");
    options.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
    if (options.data != null) {
      try {
        // debugPrint("Body: ${debugPrintObject(options.data)}");
        FormData formData = options.data as FormData;
        debugPrint("Body:");
        var buffer = [];
        for (MapEntry<String, String> pair in formData.fields) {
          buffer.add('${pair.key}:${pair.value}');
        }
        debugPrint("Body:{${buffer.join(', ')}}");
      } catch (e) {
        debugPrint("Body: ${debugPrintObject(options.data)}");
      }
    }
    debugPrint(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) {
    debugPrint("<-- ${dioError.message} ${(dioError.response?.requestOptions != null ? (dioError.response!.requestOptions.baseUrl + dioError.response!.requestOptions.path) : 'URL')}");
    debugPrint("${dioError.response != null ? dioError.response!.data : 'Unknown Error'}");
    debugPrint("<-- End error");
    if(dioError.response?.statusCode == 400){
      // MyApp.startFirstScreen("Session expire. Please login again.");
    } else if(dioError.response?.statusCode == 401){
      // MyApp.startFirstScreen("Session expire. Please login again.");
    } else if(dioError.response?.statusCode == 402){
      //MyApp.startFirstScreen("Your account has been inactive. Please contact support@leschange.com");
    }
    return super.onError(dioError, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        "<-- ${response.statusCode} ${(response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL')}");
    debugPrint("Headers:");
    response.headers.forEach((k, v) => debugPrint('$k: $v'));
    debugPrint("Response: ${response.data}");
    debugPrint("<-- END HTTP");
    return super.onResponse(response, handler);
  }
}
