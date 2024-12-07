import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tc/app/shared/widget/animated/crossfade_wrapper_container.dart';
import 'package:tc/app/shared/widget/responseive_view/response_view.dart';
import '../../../routes/app_pages.dart';
import '../controllers/train_details_controller.dart';
import '../widget/gray_info_bar.dart';
import '../widget/single_train_card.dart';

class TrainDetailsView extends GetView<TrainDetailsController> {
  const TrainDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Train Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              Get.offAllNamed(Routes.HOME);
            },
          ),
        ],
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Center(
            child: CrossfadeWrapperContainer(
              visible: !controller.isLoading.value,
              loaderHeight: Get.height,
              child: ResponsiveWidget<TrainDetailsController>(
                pc: buildDesktopView(),
                tab: buildTabletView(),
                mobile: buildMobileView(),
              ),
            ),
          ),
        );
      }),
    );
  }

  // Mobile layout
  Widget buildMobileView() {
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
}
