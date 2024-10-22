import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/train_details_controller.dart';

class TrainDetailsView extends GetView<TrainDetailsController> {
  const TrainDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrainDetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TrainDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
