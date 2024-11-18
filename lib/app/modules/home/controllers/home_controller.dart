import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  RxnString selectedValue = RxnString(null);
  TextEditingController textEditingController = TextEditingController();

  // Function to update the selected value
  void setSelected(String value) {
    selectedValue.value = value;
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
