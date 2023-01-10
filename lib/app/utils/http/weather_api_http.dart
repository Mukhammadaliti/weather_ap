import 'package:http/http.dart' as http;

import '../api_keys.dart';


class WeatherApiHttp {
  
  weatherHttp() {
    final client = http.Client();
    const url =
        'https://api.openweathermap.org/data/2.5/weather?q={city%20name}&appid=597fd8840114926137baeebbb9f68dd5';
  }
}