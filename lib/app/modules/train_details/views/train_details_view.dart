import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tc/app/shared/widget/animated/crossfade_wrapper_container.dart';
import 'package:tc/app/shared/widget/response_view.dart';
import '../controllers/train_details_controller.dart';
import '../widget/info_bar.dart';

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
        Container(
          margin: const EdgeInsets.all(10),
          height: 500,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
        )
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
