import 'package:get/get.dart';

import '../controllers/train_details_controller.dart';

class TrainDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrainDetailsController>(
      () => TrainDetailsController(),
    );
  }
}
