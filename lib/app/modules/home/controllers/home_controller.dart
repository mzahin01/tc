import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tc/app/routes/app_pages.dart';
import '../../train_details/widget/all_route_stations.dart';
import '../../train_details/widget/station_names.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;

  RxnString fromStation = RxnString(null);
  RxnString toStation = RxnString(null);
  TextEditingController fromStationText = TextEditingController();
  TextEditingController toStationText = TextEditingController();
  TextEditingController dateText = TextEditingController();
  // RxBool isFromStationFinal = false.obs;

  final List<String> seatClass = [
    'AC_B',
    'AC_S',
    'SNIGDHA',
    'F_BERTH',
    'F_SEAT',
    'F_CHAIR',
    'S_CHAIR',
    'SHOVAN',
    'SHULOV',
  ];

  List<String> get allStations => allStationsAvailable;
  List<String> get dhakaToChapaiStations => dhakaToChapai;
  List<String> get dhakaToCoxBazarStations => dhakaToCoxBazar;
  List<String> get dhakaToNoakhaliStations => dhakaToNoakhali;
  List<String> get dhakaToSylhetStations => dhakaToSylhet;
  List<String> get dhakaToKhulnaStations => dhakaToKhulna;
  List<String> get dhakaToPanchagarhStations => dhakaToPanchagarh;
  List<String> get dhakaToSaidpurStations => dhakaToSaidpur;
  List<String> get dhakaToRangpurStations => dhakaToRangpur;
  List<String> get dhakaToLalmonirhatStations => dhakaToLalmonirhat;
  List<String> get dhakaToKishoreganjStations => dhakaToKishoreganj;
  List<String> get chattogramToChandpurStations => chattogramToChandpur;
  List<String> get chattogramToSylhetStations => chattogramToSylhet;
  List<String> get rajshahiToSaidpurStations => rajshahiToSaidpur;
  List<String> get rajshahiToPanchagarhStations => rajshahiToPanchagarh;
  List<String> get sagardariExpressStationsList => sagardariExpressStations;
  List<String> get rajshahiToDhakaViaFaridpurStations =>
      rajshahiToDhakaViaFaridpur;
  List<String> get rajshahiToGopalganjStations => rajshahiToGopalganj;
  List<String> get dhakaToJamalpurStations => dhakaToJamalpur;
  List<String> get khulnaToSaidpurStations => khulnaToSaidpur;
  List<String> get dhakaToJamalpurDownStations => dhakaToJamalpurDown;
  List<String> get dhakaToSirajganjStations => dhakaToSirajganj;
  List<String> get dhakaToNetrokonaStations => dhakaToNetrokona;
  List<String> get rajshahiToPabnaStations => rajshahiToPabna;
  List<String> get chattogramToJamalpurStations => chattogramToJamalpur;
  List<String> get chattogramToCoxBazarStations => chattogramToCoxBazar;

  RxnString selectedClass = RxnString(null);
  TextEditingController seatClasstext = TextEditingController();

  RxList<String> combinedStations = <String>[].obs;

  void updateCombinedStations() {
    final Set<String> uniqueStations = {};

    if (fromStation.value != null) {
      final station = fromStation.value!;
      if (dhakaToChapaiStations.contains(station)) {
        uniqueStations.addAll(dhakaToChapaiStations);
      }
      if (dhakaToCoxBazarStations.contains(station)) {
        uniqueStations.addAll(dhakaToCoxBazarStations);
      }
      if (dhakaToNoakhaliStations.contains(station)) {
        uniqueStations.addAll(dhakaToNoakhaliStations);
      }
      if (dhakaToSylhetStations.contains(station)) {
        uniqueStations.addAll(dhakaToSylhetStations);
      }
      if (dhakaToKhulnaStations.contains(station)) {
        uniqueStations.addAll(dhakaToKhulnaStations);
      }
      if (dhakaToPanchagarhStations.contains(station)) {
        uniqueStations.addAll(dhakaToPanchagarhStations);
      }
      if (dhakaToSaidpurStations.contains(station)) {
        uniqueStations.addAll(dhakaToSaidpurStations);
      }
      if (dhakaToRangpurStations.contains(station)) {
        uniqueStations.addAll(dhakaToRangpurStations);
      }
      if (dhakaToLalmonirhatStations.contains(station)) {
        uniqueStations.addAll(dhakaToLalmonirhatStations);
      }
      if (dhakaToKishoreganjStations.contains(station)) {
        uniqueStations.addAll(dhakaToKishoreganjStations);
      }
      if (chattogramToChandpurStations.contains(station)) {
        uniqueStations.addAll(chattogramToChandpurStations);
      }
      if (chattogramToSylhetStations.contains(station)) {
        uniqueStations.addAll(chattogramToSylhetStations);
      }
      if (rajshahiToSaidpurStations.contains(station)) {
        uniqueStations.addAll(rajshahiToSaidpurStations);
      }
      if (rajshahiToPanchagarhStations.contains(station)) {
        uniqueStations.addAll(rajshahiToPanchagarhStations);
      }
      if (sagardariExpressStationsList.contains(station)) {
        uniqueStations.addAll(sagardariExpressStationsList);
      }
      if (rajshahiToDhakaViaFaridpurStations.contains(station)) {
        uniqueStations.addAll(rajshahiToDhakaViaFaridpurStations);
      }
      if (rajshahiToGopalganjStations.contains(station)) {
        uniqueStations.addAll(rajshahiToGopalganjStations);
      }
      if (dhakaToJamalpurStations.contains(station)) {
        uniqueStations.addAll(dhakaToJamalpurStations);
      }
      if (khulnaToSaidpurStations.contains(station)) {
        uniqueStations.addAll(khulnaToSaidpurStations);
      }
      if (dhakaToJamalpurDownStations.contains(station)) {
        uniqueStations.addAll(dhakaToJamalpurDownStations);
      }
      if (dhakaToSirajganjStations.contains(station)) {
        uniqueStations.addAll(dhakaToSirajganjStations);
      }
      if (dhakaToNetrokonaStations.contains(station)) {
        uniqueStations.addAll(dhakaToNetrokonaStations);
      }
      if (rajshahiToPabnaStations.contains(station)) {
        uniqueStations.addAll(rajshahiToPabnaStations);
      }
      if (chattogramToJamalpurStations.contains(station)) {
        uniqueStations.addAll(chattogramToJamalpurStations);
      }
      if (chattogramToCoxBazarStations.contains(station)) {
        uniqueStations.addAll(chattogramToCoxBazarStations);
      }
    }

    combinedStations.value = uniqueStations.toList();
  }

  selectDate() {
    showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then((value) {
      if (value != null) {
        String month = DateFormat.MMM().format(value);
        dateText.text =
            "${value.day.toString().padLeft(2, '0')}-$month-${value.year}";
      }
    });
  }

  void save() {
    Get.toNamed(Routes.TRAIN_DETAILS, arguments: {
      'from': fromStation.value,
      'to': toStation.value,
      'date': dateText.text,
      'class': selectedClass.value,
    });
  }
}
