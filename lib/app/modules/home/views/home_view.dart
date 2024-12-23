import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tc/app/shared/const/image_asset.dart';
import 'package:tc/app/shared/widget/animated/crossfade_wrapper_container.dart';
import 'package:tc/app/shared/widget/responseive_view/response_view.dart';
import 'package:tc/app/styles/spacing.dart';
import '../../../shared/widget/text_field/general_text_field.dart';
import '../controllers/home_controller.dart';
import '../widgets/dpd_button.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   for (String train in trainCodes) {
      //     TrainDetailsController().checkIfStopsInRoute(train).then((value) {
      //       writeToFile('$train\n$value\n');
      //     });
      //   }
      // }),
      body: Obx(() {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
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
      }),
    );
  }

  // Future<void> writeToFile(String content) async {
  //   try {
  //     final downloadsPath = '/Users/zahin/Downloads';
  //     final file = File('$downloadsPath/tt.txt');
  //     await file.writeAsString(content, mode: FileMode.append);
  //   } catch (e) {
  //     print('Error writing to file: $e');
  //   }
  // }

  // Mobile layout
  Widget buildMobileView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImageAsset.main_icon,
            width: 200,
            height: 200,
          ),
          const Text(
            'Welcome to TrainSheba (Mobile)',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 40),
          DPDButton(
            items: controller.allStations,
            selectedValue: controller.fromStation.value,
            onChanged: (value) {
              controller.fromStation.value = value;
              controller.updateCombinedStations();
              controller.isFormValid();
            },
            searchController: controller.seatClasstext,
            hintText: 'Where From',
            searchHint: 'Where From',
          ),
          SizedBox(width: 25),
          DPDButton(
            items: controller.fromStation.value == null
                ? []
                : controller.combinedStations,
            selectedValue: controller.toStation.value,
            onChanged: (value) {
              controller.toStation.value = value;
              controller.isFormValid();
            },
            searchController: controller.seatClasstext,
            hintText: 'Where to',
            searchHint: 'Where to',
          ),
          SizedBox(
            width: 210,
            child: TextFieldWidget.oneLine(
              borderColor: Colors.grey,
              showCursor: false,
              readOnly: true,
              hintText: 'Date',
              hintStyle: TextStyle(color: Colors.black, fontSize: 14),
              controller: controller.dateText,
              ontap: () {
                controller.selectDate();
                controller.isFormValid();
              },
              height: 40,
            ),
          ),
          SizedBox(width: 25),
          DPDButton(
            items: controller.seatClass,
            selectedValue: controller.selectedClass.value,
            onChanged: (value) {
              controller.selectedClass.value = value;
              controller.isFormValid();
            },
            searchController: controller.seatClasstext,
            hintText: 'Choose a Class',
            searchHint: 'Search Class',
          ),
          SizedBox(height: 25),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                controller.save();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.isFormV.value
                    ? Colors.greenAccent
                    : Colors.black12,
              ),
              child: Text(
                'Search',
                style: TextStyle(
                  color: controller.isFormV.value ? Colors.white : Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }

  // Tablet layout
  Widget buildTabletView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImageAsset.main_icon,
            width: 200,
            height: 200,
          ),
          const Text(
            'Welcome to TrainSheba (Tablet)',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DPDButton(
                items: controller.allStations,
                selectedValue: controller.fromStation.value,
                onChanged: (value) {
                  controller.fromStation.value = value;
                },
                searchController: controller.seatClasstext,
                hintText: 'Where From',
                searchHint: 'Where From',
              ),
              SizedBox(width: 25),
              DPDButton(
                items: controller.allStations,
                selectedValue: controller.toStation.value,
                onChanged: (value) {
                  controller.toStation.value = value;
                },
                searchController: controller.seatClasstext,
                hintText: 'Where to',
                searchHint: 'Where to',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 210,
                child: TextFieldWidget.oneLine(
                  borderColor: Colors.grey,
                  showCursor: false,
                  hintText: 'Date',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  controller: controller.dateText,
                  ontap: () {
                    controller.selectDate();
                  },
                  height: 40,
                ),
              ),
              SizedBox(width: 25),
              DPDButton(
                items: controller.seatClass,
                selectedValue: controller.selectedClass.value,
                onChanged: (value) {
                  controller.selectedClass.value = value;
                },
                searchController: controller.seatClasstext,
                hintText: 'Choose a Class',
                searchHint: 'Search Class',
              ),
            ],
          ),
          SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              controller.save();
            },
            child: const Text('Search'),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }

  // Desktop layout
  Widget buildDesktopView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImageAsset.main_icon,
            width: 200,
            height: 200,
          ),
          const Text(
            'Welcome to TrainSheba (Desktop)',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DPDButton(
                items: controller.allStations,
                selectedValue: controller.fromStation.value,
                onChanged: (value) {
                  controller.fromStation.value = value;
                },
                searchController: controller.seatClasstext,
                hintText: 'Where From',
                searchHint: 'Where From',
              ),
              SizedBox(width: 25),
              DPDButton(
                items: controller.allStations,
                selectedValue: controller.toStation.value,
                onChanged: (value) {
                  controller.toStation.value = value;
                },
                searchController: controller.seatClasstext,
                hintText: 'Where to',
                searchHint: 'Where to',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 210,
                child: TextFieldWidget.oneLine(
                  borderColor: Colors.grey,
                  showCursor: false,
                  hintText: 'Date',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  controller: controller.dateText,
                  ontap: () {
                    controller.selectDate();
                  },
                  height: 40,
                ),
              ),
              SizedBox(width: 25),
              DPDButton(
                items: controller.seatClass,
                selectedValue: controller.selectedClass.value,
                onChanged: (value) {
                  controller.selectedClass.value = value;
                },
                searchController: controller.seatClasstext,
                hintText: 'Choose a Class',
                searchHint: 'Search Class',
              ),
            ],
          ),
          SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              controller.save();
            },
            child: const Text('Search'),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
