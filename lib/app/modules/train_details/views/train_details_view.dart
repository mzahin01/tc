import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tc/app/modules/train_details/model/train_details_response/train.dart';
import 'package:tc/app/shared/widget/animated/crossfade_wrapper_container.dart';
import '../../../routes/app_pages.dart';
import '../controllers/train_details_controller.dart';

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // InfoBar(controller: controller),
                  // SingleTrainWidget(controller: controller)
                  SizedBox(height: 25),
                  // a loop for showing Map<String, List<Train>>
                  for (MapEntry<String, List<Train>> entry
                      in controller.trainMap.entries)
                    Row(
                      children: [
                        Text(entry.key),
                        for (Train train in entry.value)
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 20,
                            width: 20,
                            color: Colors.redAccent,
                          )
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
