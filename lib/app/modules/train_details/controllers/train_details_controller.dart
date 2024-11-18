// ignore_for_file: avoid_print

import 'package:get/get.dart';

class TrainDetailsController extends GetxController {
  RxBool isLoading = false.obs;

  late RxnString from;
  late RxnString to;
  late RxnString date;
  late RxnString travelClass;

  @override
  void onInit() {
    super.onInit();
    from = RxnString(Get.arguments['from']);
    to = RxnString(Get.arguments['to']);
    date = RxnString(Get.arguments['date']);
    travelClass = RxnString(Get.arguments['class']);

    print('From: ${from.value}');
    print('To: ${to.value}');
    print('Date: ${date.value}');
    print('Class: ${travelClass.value}');
  }
}
