import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api_keys.dart';

class WeatherApiHttp {
  Future<Map<String, dynamic>> weatherHttp(String url) async {
    final client = http.Client();
    Uri uri = Uri.parse(url);
    final response = await client.get(uri);
    final data = jsonDecode(response.body);
    return data;
  }
}
// 'https://api.openweathermap.org/data/2.5/weather?q={city%20name}&appid=597fd8840114926137baeebbb9f68dd5';