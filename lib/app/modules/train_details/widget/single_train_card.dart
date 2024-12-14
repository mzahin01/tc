import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tc/app/styles/colors.dart';
import '../controllers/train_details_controller.dart';

class SingleTrainWidget extends StatelessWidget {
  const SingleTrainWidget({
    super.key,
    required this.controller,
  });

  final TrainDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.trainJsonData[0].data?.trains == null) {
        return CircularProgressIndicator();
      }
      return Column(
        children: [
          for (int j = 0;
              j <
                  (controller.trainJsonData[0].data?.trains?.length.toInt() ??
                      0);
              j++)
            Container(
              margin: const EdgeInsets.all(10),
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
              child: Column(
                children: [
                  TrainTitle(
                    controller: controller,
                    j: j,
                  ),
                  LeavingDurArriving(
                    controller: controller,
                    j: j,
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0;
                            i <
                                (controller.trainJsonData[0].data?.trains?[j]
                                        .seatTypes?.length
                                        .toInt() ??
                                    0);
                            i++)
                          SeatTypeDetails(
                            controller: controller,
                            i: i,
                            j: j,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      );
    });
  }
}

class SeatTypeDetails extends StatelessWidget {
  const SeatTypeDetails({
    super.key,
    required this.controller,
    required this.i,
    required this.j,
  });

  final TrainDetailsController controller;
  final int i;
  final int j;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        color: SGColors.whiteShade2,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              controller.trainJsonData[0].data?.trains?[j].seatTypes?[i].type ??
                  ''),
          Text((double.tryParse(controller.trainJsonData[0].data?.trains?[j]
                          .seatTypes?[i].fare ??
                      '0')! +
                  (controller.trainJsonData[0].data?.trains?[j].seatTypes?[i]
                          .vatAmount ??
                      0))
              .toString()),
          Text(
              'Online - ${(controller.trainJsonData[0].data?.trains?[j].seatTypes?[i].seatCounts?.online ?? 0).toString()}'),
          Text(
              'Offline - ${(controller.trainJsonData[0].data?.trains?[j].seatTypes?[i].seatCounts?.offline ?? 0).toString()}'),
        ],
      ),
    );
  }
}

class LeavingDurArriving extends StatelessWidget {
  const LeavingDurArriving({
    super.key,
    required this.controller,
    required this.j,
  });

  final TrainDetailsController controller;
  final int j;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(controller.trainJsonData[0].data?.trains?[j].departureDateTime ??
            ''),
        Container(
          height: 2,
          width: 35,
          color: SGColors.black,
        ),
        Text(controller.trainJsonData[0].data?.trains?[j].travelTime ?? ''),
        Container(
          height: 2,
          width: 35,
          color: SGColors.black,
        ),
        Text(
            controller.trainJsonData[0].data?.trains?[j].arrivalDateTime ?? ''),
      ],
    );
  }
}

class TrainTitle extends StatelessWidget {
  const TrainTitle({
    super.key,
    required this.controller,
    required this.j,
  });

  final TrainDetailsController controller;
  final int j;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Text(controller.trainJsonData[0].data?.trains?[j].tripNumber ?? ''),
        Divider(
          color: Colors.black,
          thickness: 1,
        ),
      ],
    );
  }
}
