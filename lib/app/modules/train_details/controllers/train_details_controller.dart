import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../model/train_details_response/train_details_response.dart';
import 'package:http/http.dart' as http;
import '../widget/all_route_stations.dart';

class Tuple {
  final int first;
  final String second;
  final String third;

  Tuple(this.first, this.second, this.third);

  @override
  String toString() => '$second $third';
}

class Pair {
  final String first;
  final String second;

  Pair(this.first, this.second);

  @override
  String toString() => '$first $second';
}

class TrainDetailsController extends GetxController {
  RxBool isLoading = false.obs;
  RxnString from = RxnString(null);
  RxnString to = RxnString(null);
  RxnString date = RxnString(null);
  RxnString travelClass = RxnString(null);
  RxList<String> matchingLists = <String>[].obs;
  Rxn<TrainDetailsResponse> data = Rxn<TrainDetailsResponse>();
  List<Tuple> tempTuples = [];
  final Set<Tuple> processedRoutesSet = {};
  final Set<Pair> finalProcessedRoutesSet = {};
  final Set<String> tempFinal = {};

  final Map<String, List<String>> stationListsMap = {
    'dhakaToChapaiStations': dhakaToChapai,
    'dhakaToCoxBazarStations': dhakaToCoxBazar,
    'dhakaToNoakhaliStations': dhakaToNoakhali,
    'dhakaToSylhetStations': dhakaToSylhet,
    'dhakaToKhulnaStations': dhakaToKhulna,
    'dhakaToPanchagarhStations': dhakaToPanchagarh,
    'dhakaToSaidpurStations': dhakaToSaidpur,
    'dhakaToRangpurStations': dhakaToRangpur,
    'dhakaToLalmonirhatStations': dhakaToLalmonirhat,
    'dhakaToKishoreganjStations': dhakaToKishoreganj,
    'chattogramToChandpurStations': chattogramToChandpur,
    'chattogramToSylhetStations': chattogramToSylhet,
    'rajshahiToSaidpurStations': rajshahiToSaidpur,
    'rajshahiToPanchagarhStations': rajshahiToPanchagarh,
    'sagardariExpressStationsList': sagardariExpressStations,
    'rajshahiToDhakaViaFaridpurStations': rajshahiToDhakaViaFaridpur,
    'rajshahiToGopalganjStations': rajshahiToGopalganj,
    'dhakaToJamalpurStations': dhakaToJamalpur,
    'khulnaToSaidpurStations': khulnaToSaidpur,
    'dhakaToJamalpurDownStations': dhakaToJamalpurDown,
    'dhakaToSirajganjStations': dhakaToSirajganj,
    'dhakaToNetrokonaStations': dhakaToNetrokona,
    'rajshahiToPabnaStations': rajshahiToPabna,
    'chattogramToJamalpurStations': chattogramToJamalpur,
    'chattogramToCoxBazarStations': chattogramToCoxBazar,
  };

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
    passMatchingListsToProcessRoutes();
  }

  void passMatchingListsToProcessRoutes() {
    final List<List<String>> routesToProcess = [];
    final List<String> ft = [from.value ?? '', to.value ?? ''];

    for (String listName in matchingLists) {
      if (stationListsMap.containsKey(listName)) {
        routesToProcess.add(stationListsMap[listName]!);
      }
    }
    for (int i = 0; i < routesToProcess.length; i++) {
      processRoutes(ft, routesToProcess[i]);
    }
    tempTuples.sort((a, b) => a.first.compareTo(b.first));
    for (var tuple in tempTuples) {
      // processedRoutesSet.add(tuple);
      tempFinal.add(tuple.toString());
    }
    for (var tuple in tempFinal) {
      List<String> temp = tuple.split(' ');

      // Check if the list has at least two elements
      if (temp.length >= 2) {
        finalProcessedRoutesSet.add(Pair(temp[0], temp[1]));
      }
    }

    print(processedRoutesSet);
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

  void processRoutes(List<String> ft, List<String> route) {
    List<Tuple> tuples = [];
    int m = route.indexOf(ft[0]);
    int n = route.indexOf(ft[1]);
    if (m > n) {
      route = route.reversed.toList();
      m = route.indexOf(ft[0]);
      n = route.indexOf(ft[1]);
    }

    for (int i = m; i > -1; i--) {
      for (int j = n; j < route.length; j++) {
        Tuple temp = Tuple((j - i).abs(), route[i], route[j]);
        tuples.add(temp);
      }
    }

    for (var tuple in tuples) {
      tempTuples.add(tuple);
    }
  }
}
