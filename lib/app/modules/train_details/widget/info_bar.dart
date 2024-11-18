import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tc/app/shared/const/image_asset.dart';
import '../controllers/train_details_controller.dart';

class InfoBar extends StatelessWidget {
  const InfoBar({
    super.key,
    required this.controller,
  });

  final TrainDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        height: 120,
        color: Colors.black12,
        padding: EdgeInsets.only(left: 40, right: 40),
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
                    'From: ${controller.from.value} To: ${controller.to.value}'),
                SizedBox(height: 10),
                Text('Date: ${controller.date.value}'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Button 1 action
                  },
                  child: Text('What am'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Button 2 action
                  },
                  child: Text('I doing'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Button 3 action
                  },
                  child: Text('here?'),
                ),
              ],
            )
          ],
        ));
  }
}
