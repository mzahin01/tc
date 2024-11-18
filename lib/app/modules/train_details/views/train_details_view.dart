import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tc/app/shared/widget/animated/crossfade_wrapper_container.dart';
import 'package:tc/app/shared/widget/response_view.dart';
import '../controllers/train_details_controller.dart';
import '../widget/gray_info_bar.dart';
import '../widget/single_train_card.dart';

class TrainDetailsView extends GetView<TrainDetailsController> {
  const TrainDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        return SingleChildScrollView(
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
      }),
    );
  }

  // Mobile layout
  Widget buildMobileView() {
    return Center(
      child: Text('datajb'),
    );
  }

  // Tablet layout
  Widget buildTabletView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InfoBar(controller: controller),
        SizedBox(height: 25),
        SingleTrainWidget(controller: controller)
      ],
    );
  }

  // Desktop layout
  Widget buildDesktopView() {
    return Center(
      child: Text('data'),
    );
  }
}
