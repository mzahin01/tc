import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tc/app/shared/widget/animated/crossfade_wrapper_container.dart';
import 'package:tc/app/shared/widget/response_view.dart';
import 'package:tc/app/styles/spacing.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(Spacing.xxlarge),
          child: CrossfadeWrapperContainer(
            visible: !controller.isLoading.value,
            loaderHeight: Get.height,
            child: ResponsiveWidget<HomeController>(
              pc: buildDesktopView(),
              tab: buildTabletView(),
              mobile: buildMobileView(),
            ),
          ),
        ),
      ),
    );
  }

  // Mobile layout
  Widget buildMobileView() {
    return Column(
      key: ValueKey(Get.width),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Welcome to TrainSheba (Mobile)',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          Get.width.toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  // Tablet layout
  Widget buildTabletView() {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to TrainSheba (Tablet)',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Screen Width: ',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ));
  }

  // Desktop layout
  Widget buildDesktopView() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome to TrainSheba (Desktop)',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Screen Width: ',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
