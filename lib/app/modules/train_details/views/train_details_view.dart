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
                  Text(controller.date.value ?? ''),
                  for (MapEntry<String, List<Train>> entry
                      in controller.trainMap.entries)
                    Column(
                      children: [
                        Text(entry.value[0].tripNumber ?? ''),
                        for (Train train in entry.value)
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              // height: 20,
                              // width: 20,
                              child: Row(
                                children: [
                                  Text(controller.counter.value.toString(),
                                      style: TextStyle(
                                          fontSize: 0,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold)),
                                  Column(
                                    children: [
                                      Text(train.originCityName ?? ''),
                                      Text(' to '),
                                      Text(train.destinationCityName ?? ''),
                                    ],
                                  ),
                                  if (train.seatTypes != null)
                                    for (var station in train.seatTypes!)
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          if (station.seatCounts?.online != 0 ||
                                              station.seatCounts?.offline != 0)
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  SizedBox(width: 10),
                                                  Text(station.type ?? ''),
                                                  SizedBox(width: 10),
                                                  Text(((station.seatCounts
                                                                  ?.offline ??
                                                              0) +
                                                          (station.seatCounts
                                                                  ?.online ??
                                                              0))
                                                      .toString()),
                                                  SizedBox(width: 10),
                                                  Text(station.fare ?? ''),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                ],
                              ),
                            ),
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
