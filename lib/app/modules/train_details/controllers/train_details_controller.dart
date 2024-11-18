// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../model/train_details_response/train_details_response.dart';

import 'package:http/http.dart' as http;

class TrainDetailsController extends GetxController {
  RxBool isLoading = false.obs;
  RxnString from = RxnString(null);
  RxnString to = RxnString(null);
  RxnString date = RxnString(null);
  RxnString travelClass = RxnString(null);
  Rxn<TrainDetailsResponse> data = Rxn<TrainDetailsResponse>();

  @override
  void onInit() {
    super.onInit();
    // Extracting values from Get.arguments
    from.value = Get.arguments['from'] ?? '';
    to.value = Get.arguments['to'] ?? '';
    date.value = Get.arguments['date'] ?? '';
    travelClass.value = Get.arguments['class'] ?? '';
    loadData();

    // Construct the URL
    String baseURL =
        'https://railspaapi.shohoz.com/v1.0/web/bookings/search-trips-v2';
    String fullURL =
        '$baseURL?from_city=${Uri.encodeComponent(from.value ?? '')}&to_city=${Uri.encodeComponent(to.value ?? '')}&date_of_journey=${Uri.encodeComponent(date.value ?? '')}&seat_class=${Uri.encodeComponent(travelClass.value ?? '')}';
    fetchTrainDetails(fullURL);
  }

  Future<void> loadData() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/json/test.json');
      final Map<String, dynamic> jsonResponse = json.decode(jsonString);
      data.value = TrainDetailsResponse.fromJson(jsonResponse);
      print('Data: ${data.value}');
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  Future<void> fetchTrainDetails(String fullURL) async {
    try {
      final response = await http.get(
        Uri.parse(fullURL),
      );

      if (response.statusCode == 200) {
        print('Response: ${response.body}');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
