import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tc/app/shared/const/image_asset.dart';
import 'package:tc/app/styles/colors.dart';
import '../controllers/train_details_controller.dart';

class InfoBar extends StatelessWidget {
  const InfoBar({
    super.key,
    required this.controller,
  });

  final TrainDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: Get.width,
        height: 140,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: SGColors.whiteShade3,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImageAsset.main_icon, width: 100, height: 100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'From: ${controller.trainJsonData[0].data?.trains?[0].originCityName} To: ${controller.trainJsonData[0].data?.trains?[0].destinationCityName}'),
                SizedBox(height: 10),
                Text(
                    'Date: ${controller.trainJsonData[0].data?.trains?[0].departureFullDate}'),
              ],
            ),
          ],
        ),
      );
    });
  }
}
