import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../model/train_details_response/train_details_response.dart';
import 'package:http/http.dart' as http;

class TrainDetailsController extends GetxController {
  RxBool isLoading = false.obs;
  RxnString from = RxnString(null);
  RxnString to = RxnString(null);
  RxnString date = RxnString(null);
  RxnString travelClass = RxnString(null);
  RxList<String> matchingLists = <String>[].obs;
  Rxn<TrainDetailsResponse> data = Rxn<TrainDetailsResponse>();

  @override
  void onInit() {
    super.onInit();
    from.value = Get.arguments['from'] ?? '';
    to.value = Get.arguments['to'] ?? '';
    date.value = Get.arguments['date'] ?? '';
    travelClass.value = Get.arguments['class'] ?? '';
    matchingLists.value = Get.arguments['matching'] ?? '';

    String base = 'railspaapi.shohoz.com';
    String path = '/v1.0/web/bookings/search-trips-v2';
    Map<String, String> queryParams = {
      'from_city': from.value ?? '',
      'to_city': to.value ?? '',
      'date_of_journey': date.value ?? '',
      'seat_class': travelClass.value ?? '',
    };

    Uri uri = Uri.http(base, path, queryParams);
    String fullURL = uri.toString();
    fetchTrainDetails(fullURL);
  }

  Future<void> fetchTrainDetails(String fullURL) async {
    if (kDebugMode) {
      print(fullURL);
    }

    try {
      final response = await http.get(
        Uri.parse(fullURL),
        headers: {
          'User-Agent':
              'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
          'Accept':
              'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
          'Accept-Language': 'en-US,en;q=0.9',
        },
      );

      if (response.statusCode == 200) {
        data.value = TrainDetailsResponse.fromJson(jsonDecode(response.body));
      } else {
        if (kDebugMode) {
          print('Error: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
    }
  }
}
