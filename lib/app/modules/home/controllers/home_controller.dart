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
