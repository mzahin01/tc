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

  final List<String> seatClass = [
    'Any Type',
    'Only S_CHAIR',
    'Only SNIGDHA',
    'Only F_CHAIR',
    'Only SHOVAN',
    'Only SHULOV',
    'Only F_SEAT',
    'Only F_BERTH',
    'Only AC_S',
    'Only AC_B',
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

  RxList<String> combinedStations = RxList.empty(growable: true);
  RxList<String> matchingLists = RxList.empty(growable: true);

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

  void findMatchingLists() {
    final List<String> listsContainingBothStations = [];

    if (fromStation.value != null && toStation.value != null) {
      final from = fromStation.value!;
      final to = toStation.value!;

      if (dhakaToChapaiStations.contains(from) &&
          dhakaToChapaiStations.contains(to)) {
        listsContainingBothStations.add('dhakaToChapaiStations');
      }
      if (dhakaToCoxBazarStations.contains(from) &&
          dhakaToCoxBazarStations.contains(to)) {
        listsContainingBothStations.add('dhakaToCoxBazarStations');
      }
      if (dhakaToNoakhaliStations.contains(from) &&
          dhakaToNoakhaliStations.contains(to)) {
        listsContainingBothStations.add('dhakaToNoakhaliStations');
      }
      if (dhakaToSylhetStations.contains(from) &&
          dhakaToSylhetStations.contains(to)) {
        listsContainingBothStations.add('dhakaToSylhetStations');
      }
      if (dhakaToKhulnaStations.contains(from) &&
          dhakaToKhulnaStations.contains(to)) {
        listsContainingBothStations.add('dhakaToKhulnaStations');
      }
      if (dhakaToPanchagarhStations.contains(from) &&
          dhakaToPanchagarhStations.contains(to)) {
        listsContainingBothStations.add('dhakaToPanchagarhStations');
      }
      if (dhakaToSaidpurStations.contains(from) &&
          dhakaToSaidpurStations.contains(to)) {
        listsContainingBothStations.add('dhakaToSaidpurStations');
      }
      if (dhakaToRangpurStations.contains(from) &&
          dhakaToRangpurStations.contains(to)) {
        listsContainingBothStations.add('dhakaToRangpurStations');
      }
      if (dhakaToLalmonirhatStations.contains(from) &&
          dhakaToLalmonirhatStations.contains(to)) {
        listsContainingBothStations.add('dhakaToLalmonirhatStations');
      }
      if (dhakaToKishoreganjStations.contains(from) &&
          dhakaToKishoreganjStations.contains(to)) {
        listsContainingBothStations.add('dhakaToKishoreganjStations');
      }
      if (chattogramToChandpurStations.contains(from) &&
          chattogramToChandpurStations.contains(to)) {
        listsContainingBothStations.add('chattogramToChandpurStations');
      }
      if (chattogramToSylhetStations.contains(from) &&
          chattogramToSylhetStations.contains(to)) {
        listsContainingBothStations.add('chattogramToSylhetStations');
      }
      if (rajshahiToSaidpurStations.contains(from) &&
          rajshahiToSaidpurStations.contains(to)) {
        listsContainingBothStations.add('rajshahiToSaidpurStations');
      }
      if (rajshahiToPanchagarhStations.contains(from) &&
          rajshahiToPanchagarhStations.contains(to)) {
        listsContainingBothStations.add('rajshahiToPanchagarhStations');
      }
      if (sagardariExpressStationsList.contains(from) &&
          sagardariExpressStationsList.contains(to)) {
        listsContainingBothStations.add('sagardariExpressStationsList');
      }
      if (rajshahiToDhakaViaFaridpurStations.contains(from) &&
          rajshahiToDhakaViaFaridpurStations.contains(to)) {
        listsContainingBothStations.add('rajshahiToDhakaViaFaridpurStations');
      }
      if (rajshahiToGopalganjStations.contains(from) &&
          rajshahiToGopalganjStations.contains(to)) {
        listsContainingBothStations.add('rajshahiToGopalganjStations');
      }
      if (dhakaToJamalpurStations.contains(from) &&
          dhakaToJamalpurStations.contains(to)) {
        listsContainingBothStations.add('dhakaToJamalpurStations');
      }
      if (khulnaToSaidpurStations.contains(from) &&
          khulnaToSaidpurStations.contains(to)) {
        listsContainingBothStations.add('khulnaToSaidpurStations');
      }
      if (dhakaToJamalpurDownStations.contains(from) &&
          dhakaToJamalpurDownStations.contains(to)) {
        listsContainingBothStations.add('dhakaToJamalpurDownStations');
      }
      if (dhakaToSirajganjStations.contains(from) &&
          dhakaToSirajganjStations.contains(to)) {
        listsContainingBothStations.add('dhakaToSirajganjStations');
      }
      if (dhakaToNetrokonaStations.contains(from) &&
          dhakaToNetrokonaStations.contains(to)) {
        listsContainingBothStations.add('dhakaToNetrokonaStations');
      }
      if (rajshahiToPabnaStations.contains(from) &&
          rajshahiToPabnaStations.contains(to)) {
        listsContainingBothStations.add('rajshahiToPabnaStations');
      }
      if (chattogramToJamalpurStations.contains(from) &&
          chattogramToJamalpurStations.contains(to)) {
        listsContainingBothStations.add('chattogramToJamalpurStations');
      }
      if (chattogramToCoxBazarStations.contains(from) &&
          chattogramToCoxBazarStations.contains(to)) {
        listsContainingBothStations.add('chattogramToCoxBazarStations');
      }
    }

    matchingLists.value = listsContainingBothStations;
    // print(matchingLists);
  }

  selectDate() {
    showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 10)),
    ).then((value) {
      if (value != null) {
        String month = DateFormat.MMM().format(value);
        dateText.text =
            "${value.day.toString().padLeft(2, '0')}-$month-${value.year}";
      }
    });
  }

  RxBool isFormV = false.obs;

  void isFormValid() {
    if (fromStation.value != null &&
        toStation.value != null &&
        dateText.text.isNotEmpty &&
        selectedClass.value != null) {
      isFormV.value = true;
    } else {
      isFormV.value = false;
    }
  }

  void save() {
    if (!isFormV.value) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }
    findMatchingLists();
    Get.toNamed(Routes.TRAIN_DETAILS, arguments: {
      'from': fromStation.value,
      'to': toStation.value,
      'date': dateText.text,
      'class': selectedClass.value,
      'matching': matchingLists,
    });
  }
}
