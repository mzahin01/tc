import 'package:get/get.dart';

class HomeController extends GetxController {
  late RxDouble screenWidth;
  late RxDouble desktopBreakpoint;
  late RxDouble tabletBreakpoint;

  @override
  void onInit() {
    super.onInit();
    screenWidth = Get.width.obs;
    desktopBreakpoint = 1200.0.obs;
    tabletBreakpoint = 800.0.obs;
  }
}
