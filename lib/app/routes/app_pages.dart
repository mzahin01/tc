import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/train_details/bindings/train_details_binding.dart';
import '../modules/train_details/views/train_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TRAIN_DETAILS,
      page: () => const TrainDetailsView(),
      binding: TrainDetailsBinding(),
    ),
  ];
}
