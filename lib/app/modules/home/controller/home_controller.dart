import 'package:get/get.dart';
import 'package:weather_app/app/data/services/geo_locatoin.dart';
import 'package:weather_app/app/data/services/get_weather_city.dart';

class HomeController extends GetxController {
  Rx<String> cityName = ''.obs;
  Rx<String> description = ''.obs;
  Rx<String> icons = ''.obs;
  Rx<dynamic> temp = ''.obs;
  Rx<bool> ailanipAtat = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  showWearherByLocation() async {
    final position = await GeoLocation.getPosition();
    await GetWeatherCity.getWeatherByLocation(position);
  }
}
