import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_api_structure/models/quotes_list_model.dart';
import 'package:login_api_structure/models/quotes_single_model.dart';
import 'package:login_api_structure/networking/api_provider.dart';


class QuotesController extends GetxController {
  // Instead of RxList<Quote>, use Rx<Map<String, dynamic>>
  var quote = Rxn<QuotesSingleModel>();  //object
  var posts = <QuotesListModel>[].obs; //list
  var isLoading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuotes();
    fetchQuotesList();
  }



  Future<void> fetchQuotes() async {
    isLoading(true);
    errorMessage('');
    try {
      final response = await ApiProvider().getObjectApi();
      // debugPrint("===okhttp c response: $response");
      // debugPrint("===okhttp c response check: ${response!=null} }");
      // debugPrint("===okhttp c parsed: ${QuotesSingleModel.fromJson(response)} }");

      if (response!=null) {
        quote.value = response;
        // debugPrint("===okhttp  quote: ${quote.value}");

      } else {
        errorMessage('Failed to load quotes');
      }
    } catch (e) {
      errorMessage('Error: $e');
    } finally {
      isLoading(false);
    }
  }


  Future<void> fetchQuotesList() async {
    isLoading(true);
    errorMessage('');
    try {
      final response = await ApiProvider().getListApi();
      debugPrint("===okhttp quote response: $response");
      debugPrint("===okhttp quote response check: ${response!=null} }");
      // debugPrint("===okhttp c parsed: ${QuotesSingleModel.fromJson(response)} }");

      if (response!=null) {
        posts.value = response;
        // posts.value = data.map((e) => QuotesListModel.fromJson(e)).toList();
        debugPrint("===okhttp  quote list : ${posts.value}");

      } else {
        errorMessage('Failed to load quotes');
      }
    } catch (e) {
      errorMessage('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
// Create a Quote model class that matches the structure of the JSONPlaceholder response.
class Quote {
  final int userId;
  final int id;
  final String title;
  final String body;

  Quote({required this.userId, required this.id, required this.title, required this.body});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      userId: json['userId'] ?? 0, //added null check
      id: json['id'] ?? 0,           //added null check
      title: json['title'] ?? '',     //added null check
      body: json['body'] ?? '',       //added null check
    );
  }
}