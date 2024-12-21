import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tc/app/modules/train_details/model/route_details_response/route_details_response.dart';
import 'package:tc/app/modules/train_details/model/train_details_response/train.dart';
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
  RxBool isSearching = false.obs;
  RxBool isLoading = false.obs;
  RxnString from = RxnString(null);
  RxnString to = RxnString(null);
  String initFrom = '';
  String initTo = '';
  RxnString date = RxnString(null);
  RxnString travelClass = RxnString(null);
  RxList<String> matchingLists = RxList.empty(growable: true);
  // RxList<TrainDetailsResponse> trainJsonData = RxList.empty(growable: true);
  List<Tuple> tempTuples = [];
  final Set<Tuple> processedRoutesSet = {};
  final Set<Pair> finalProcessedRoutesSet = {};
  final Set<String> tempFinal = {};
  RxInt counter = 0.obs;

  // String is "train_model"
  final RxMap<String, List<Train>> trainMap = RxMap({});

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

  String getFullURL(String from, String to) {
    String base = 'railspaapi.shohoz.com';
    String path = '/v1.0/web/bookings/search-trips-v2';
    Map<String, String> queryParams = {
      'from_city': from,
      'to_city': to,
      'date_of_journey': date.value ?? '',
      'seat_class': 'S_CHAIR',
    };

    Uri uri = Uri.http(base, path, queryParams);
    return uri.toString();
  }

  @override
  void onInit() async {
    super.onInit();
    from.value = Get.arguments['from'] ?? '';
    to.value = Get.arguments['to'] ?? '';
    date.value = Get.arguments['date'] ?? '';
    travelClass.value = Get.arguments['class'] ?? '';
    matchingLists.value = Get.arguments['matching'] ?? '';
    isSearching.value = true;
    passMatchingListsToProcessRoutes();
    getFinalTrainData();
  }

  Future<void> getFinalTrainData() async {
    initFrom = from.value ?? '';
    initTo = to.value ?? '';
    for (Pair pair in finalProcessedRoutesSet) {
      counter.value++;
      from.value = pair.first;
      to.value = pair.second;
      String fullURL = getFullURL(from.value ?? '', to.value ?? '');
      TrainDetailsResponse? res = await fetchTrainDetails(fullURL);
      if (res != null) {
        for (Train train in res.data?.trains ?? []) {
          if (train.seatTypes!.isNotEmpty &&
              train.seatTypes!.any((seatType) =>
                  seatType.seatCounts!.online! > 0 ||
                  seatType.seatCounts!.offline! > 0)) {
            if (trainMap.containsKey(train.trainModel)) {
              trainMap[train.trainModel]?.add(train);
            } else {
              trainMap[train.trainModel ?? ''] = [train];
            }
          }
        }
      }
    }
    isSearching.value = false;
    from.value = initFrom;
    to.value = initTo;
  }

  Future<RouteDetailsResponse?> checkIfStopsInRoute(String? trainModel) async {
    String fullURL = 'https://railspaapi.shohoz.com/v1.0/web/train-routes';

    try {
      final response = await http.post(
        Uri.parse(fullURL),
        headers: {
          'User-Agent':
              'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
          'Accept':
              'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
          'Accept-Language': 'en-US,en;q=0.9',
        },
        body: jsonEncode({
          'model': trainModel,
          'departure_date_time': '2024-12-24',
        }),
      );

      if (response.statusCode == 200) {
        RouteDetailsResponse routeDetailsResponse =
            RouteDetailsResponse.fromJson(jsonDecode(response.body));
        print(routeDetailsResponse.toString());
        return routeDetailsResponse;
      } else {
        if (kDebugMode) {
          print('Error: ${response.statusCode}');
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      return null;
    }
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
      tempFinal.add(tuple.toString());
    }
    for (var tuple in tempFinal) {
      List<String> temp = tuple.split(' ');

      if (temp.length >= 2) {
        finalProcessedRoutesSet.add(Pair(temp[0], temp[1]));
      }
    }
    // print(finalProcessedRoutesSet);
  }

  Future<TrainDetailsResponse?> fetchTrainDetails(String fullURL) async {
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
        return TrainDetailsResponse.fromJson(jsonDecode(response.body));
      } else {
        if (kDebugMode) {
          print('Error: ${response.statusCode}');
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      return null;
    }
  }

  void processRoutes(List<String> fromAndToStation, List<String> route) {
    List<Tuple> tuples = [];
    int m = route.indexOf(fromAndToStation[0]);
    int n = route.indexOf(fromAndToStation[1]);
    if (m > n) {
      route = route.reversed.toList();
      m = route.indexOf(fromAndToStation[0]);
      n = route.indexOf(fromAndToStation[1]);
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
