import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tc/app/routes/app_pages.dart';
import '../../train_details/widget/station_names.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;

  RxnString fromStation = RxnString(null);
  RxnString toStation = RxnString(null);
  TextEditingController fromStationText = TextEditingController();
  TextEditingController toStationText = TextEditingController();
  TextEditingController dateText = TextEditingController();
  List<String> get stationNames => allStationNames;

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
