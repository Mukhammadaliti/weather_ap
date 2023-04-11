import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/app/utils/api_keys.dart';
import 'package:weather_app/app/utils/weather_util.dart';

class GetCityName {
  static Future getWeatherByCityName(String _typeCityName) async {
    try {
      final http = Client();
      Uri uri = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=${_typeCityName}&appid=${apiKeys.weatherApiKey}');
      var response = await http.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        final kelvin = jsonData['main']['temp'];
        // cityName = jsonData['name'];
        // temp = WeatherUtil.kelvinToCelcius(kelvin);
        // _description = WeatherUtil.getDescription(num.parse(_temp));
        // _icons = WeatherUtil.getWeatherIcon(kelvin);

        // _ailanipAtat = false;
      }
    } catch (error) {
      // _ailanipAtat = false;
      throw Exception(error);
    }
  }
}
