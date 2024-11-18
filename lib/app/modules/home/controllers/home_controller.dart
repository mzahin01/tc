// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;

  final List<String> stationNames = [
    'Chattogram',
    'Kumira',
    'Feni',
    'Nangolkot',
    'Laksam',
    'Cumilla',
    'Quasba',
    'Akhaura',
    'Brahmanbaria',
    'Ashuganj',
    'Bhairab Bazar',
    'Narsingdi',
    'Biman Bandar',
    'Dhaka',
    'Khulna',
    'Noapara',
    'Jashore',
    'Mubarakganj',
    'Kotchandpur',
    'Safdarpur',
    'Darshana_Halt',
    'Chuadanga',
    'Alamdanga',
    'Poradaha',
    'Mirpur',
    'Bheramara',
    'Pakshi',
    'Ishwardi',
    'Azim Nagar',
    'Abdulpur',
    'Rajshahi',
  ];
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
    'AC_CHAIR',
  ];

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
        dateText.text = "${value.day}-$month-${value.year}";
      }
    });
  }

  void save() {
    print('From: ${fromStation.value}');
    print('To: ${toStation.value}');
    print('Date: ${dateText.text}');
    print('Class: ${selectedClass.value}');
  }
}
