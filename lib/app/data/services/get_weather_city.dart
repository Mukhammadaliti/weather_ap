import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_app/app/utils/api_keys.dart';
import 'package:weather_app/app/utils/weather_util.dart';

class GetWeatherCity {
  static Future<void> getWeatherByLocation(Position position) async {
    try {
      // ailanipAtat = true;

      final http = Client();
      Uri uri = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=${apiKeys.weatherApiKey}');

      var response = await http.get(uri);

      final maalymat = jsonDecode(response.body) as Map<String, dynamic>;
      // _cityName = maalymat['name'];

      final kelvin = maalymat['main']['temp'] as num;
      // _description = WeatherUtil.getDescription(num.parse(_temp));
      // _icons = WeatherUtil.getWeatherIcon(kelvin);
      // _temp = WeatherUtil.kelvinToCelcius(kelvin);
      //   _ailanipAtat = false;
    } catch (kata) {
      // _ailanipAtat = false;
      throw Exception(kata);
    }
  }
}
