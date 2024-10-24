import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true,
      ),
      body: Center(
          child: controller.screenWidth.value >
                  controller.desktopBreakpoint.value
              ? buildDesktopView()
              : controller.screenWidth.value > controller.tabletBreakpoint.value
                  ? buildTabletView()
                  : buildMobileView()),
    );
  }

  // Mobile layout
  Widget buildMobileView() {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to TrainSheba (Mobile)',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Screen Width: ${controller.screenWidth.value}',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ));
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
              'Screen Width: ${controller.screenWidth.value}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ));
  }

  // Desktop layout
  Widget buildDesktopView() {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to TrainSheba (Desktop)',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Screen Width: ${controller.screenWidth.value}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ));
  }
}
