import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tc/app/shared/widget/animated/crossfade_wrapper_container.dart';
import 'package:tc/app/shared/widget/response_view.dart';
import 'package:tc/app/styles/colors.dart';
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

class SingleTrainWidget extends StatelessWidget {
  const SingleTrainWidget({
    super.key,
    required this.controller,
  });

  final TrainDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int j = 0;
            j < (controller.data.value?.data?.trains?.length.toInt() ?? 0);
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0;
                        i <
                            (controller.data.value?.data?.trains?[j].seatTypes
                                    ?.length
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
              ],
            ),
          ),
      ],
    );
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
              controller.data.value?.data?.trains?[j].seatTypes?[i].type ?? ''),
          Text((double.tryParse(controller
                          .data.value?.data?.trains?[j].seatTypes?[i].fare ??
                      '0')! +
                  (controller.data.value?.data?.trains?[j].seatTypes?[i]
                          .vatAmount ??
                      0))
              .toString()),
          Text(
              'Online - ${(controller.data.value?.data?.trains?[j].seatTypes?[i].seatCounts?.online ?? 0).toString()}'),
          Text(
              'Offline - ${(controller.data.value?.data?.trains?[j].seatTypes?[i].seatCounts?.offline ?? 0).toString()}'),
        ],
      ),
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
        Text(controller.data.value?.data?.trains?[j].tripNumber ?? ''),
        Divider(
          color: Colors.black,
          thickness: 1,
        ),
      ],
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
        Text(controller.data.value?.data?.trains?[j].departureDateTime ?? ''),
        Container(
          height: 2,
          width: 35,
          color: SGColors.black,
        ),
        Text(controller.data.value?.data?.trains?[j].travelTime ?? ''),
        Container(
          height: 2,
          width: 35,
          color: SGColors.black,
        ),
        Text(controller.data.value?.data?.trains?[j].arrivalDateTime ?? ''),
      ],
    );
  }
}
