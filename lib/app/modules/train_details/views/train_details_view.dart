import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tc/app/shared/widget/animated/crossfade_wrapper_container.dart';
import 'package:tc/app/shared/widget/response_view.dart';
import 'package:tc/app/styles/spacing.dart';

import '../controllers/train_details_controller.dart';

class TrainDetailsView extends GetView<TrainDetailsController> {
  const TrainDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(Spacing.xxlarge),
        child: CrossfadeWrapperContainer(
          visible: !controller.isLoading.value,
          loaderHeight: Get.height,
          child: ResponsiveWidget<TrainDetailsController>(
            pc: buildDesktopView(),
            tab: buildTabletView(),
            mobile: buildMobileView(),
          ),
        ),
      );
    });
  }

  // Mobile layout
  Widget buildMobileView() {
    return Center(
      child: Text('datajb'),
    );
  }

  // Tablet layout
  Widget buildTabletView() {
    return Center(
      child: Text('data'),
    );
  }

  // Desktop layout
  Widget buildDesktopView() {
    return Center(
      child: Text('data'),
    );
  }
}
