import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TrainDetailsController extends GetxController {
  RxBool isLoading = false.obs;

  late RxnString from;
  late RxnString to;
  late RxnString date;
  late RxnString travelClass;

  @override
  void onInit() {
    super.onInit();

    // Extracting values from Get.arguments
    String from = Get.arguments['from'] ?? '';
    String to = Get.arguments['to'] ?? '';
    String date = Get.arguments['date'] ?? '';
    String travelClass = Get.arguments['class'] ?? '';

    // Construct the URL
    String baseURL =
        'https://railspaapi.shohoz.com/v1.0/web/bookings/search-trips-v2';
    String fullURL =
        '$baseURL?from_city=${Uri.encodeComponent(from)}&to_city=${Uri.encodeComponent(to)}&date_of_journey=${Uri.encodeComponent(date)}&seat_class=${Uri.encodeComponent(travelClass)}';

    fetchTrainDetails(fullURL);
  }

  Future<void> fetchTrainDetails(String fullURL) async {
    try {
      final response = await http.get(
        Uri.parse(fullURL),
        headers: {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36',
          'Accept': '*/*',
        },
      );

      if (response.statusCode == 200) {
        print('Response: ${response.body}');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  // isLoading.value = true;
  // try {
  //   // Fetch train details
  //   final response = await http.get(Uri.parse(fullURL));
  //   if (response.statusCode == 200) {
  //     // Parse the response
  //     final data = jsonDecode(response.body);
  //     // Handle the parsed data
  //     print(data);
  //   } else {
  //     print('Failed to load train details');
  //   }
  // } catch (e) {
  //   print('Error: $e');
  //   // print(fullURL);
  // } finally {
  //   isLoading.value = false;
  // }
  // }
}
