import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  // void setSelectedStation(String value) {
  //   fromStation.value = value;
  // }

  // void setToStation(String value) {
  //   toStation.value = value;
  // }

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

  // // Function to update the selected value
  // void setClass(String value) {
  //   selectedseatClass.value = value;
  // }

  void save() {
    print('From: ${fromStation.value}');
    print('To: ${toStation.value}');
    print('Class: ${selectedClass.value}');
  }
}
