import 'dart:convert';
import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_app/app/presentation/pages/search_page.dart';

import '../../data/services/geo_locatoin.dart';
import '../../utils/constans/app_colors/app_colors.dart';
import '../../utils/constans/text_styles/app_text_styles.dart';
import '../../utils/weather_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _cityName = '';
  String _description = '';
  String _icons = '';
  dynamic _temp = '';
  bool _ailanipAtat = false;

  @override
  void initState() {
    setState(() {
      _ailanipAtat = true;
    });
    log('Init State ===> ');

    showWearherByLocation();

    super.initState();
  }

  showWearherByLocation() async {
    final position = await GeoLocation().getPosition();
    await getWeatherByLocation(position);
    // log('position.latitude ====>${position.latitude} ');
    // log('position.longitude ====>${position.longitude} ');
  }

  Future<void> getWeatherByLocation (Position position) async {
    try {
       setState(() {
   _ailanipAtat = true;
 });
    final http = Client();
    Uri uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=597fd8840114926137baeebbb9f68dd5');
    
      var response = await http.get(uri);
      // log('jooop ====> ${response.data}');
      final maalymat = jsonDecode(response.body) as Map <String, dynamic>;
      _cityName = maalymat['name'];

      final kelvin = maalymat['main']['temp'] as num;
      _description = WeatherUtil.getDescription(num.parse(_temp));
      _icons = WeatherUtil.getWeatherIcon(kelvin);
      _temp = WeatherUtil.kelvinToCelcius(kelvin);
      setState(() {
        _ailanipAtat = false;
      });
    
    } catch (kata) {setState(() {
      _ailanipAtat = false;
    });
      throw Exception(kata);
    }
  }

  Future getWeatherByCityName(String _typeCityName) async {
    try {
      final http = Client();
      Uri uri = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=${_typeCityName}&appid=597fd8840114926137baeebbb9f68dd5');
      var response = await http.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        final kelvin = jsonData['main']['temp'];
        _cityName = jsonData['name'];
        _temp = WeatherUtil.kelvinToCelcius(kelvin);
        _description = WeatherUtil.getDescription(num.parse(_temp));
        _icons = WeatherUtil.getWeatherIcon(kelvin);

        setState(() {
          _ailanipAtat = false;
        });
      }
    } catch (error) {
      setState(() {
        _ailanipAtat = false;
      });
      throw Exception(error);
    }
  }
  // get
  // post + get
  // put - update
  // delete

  @override
  Widget build(BuildContext context) {
    log('Build ====> ');
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.location_on_outlined,
            size: 50,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 365),
          child: InkWell(
            onTap: () async {
              final _typeUserSearch = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
              await getWeatherByCityName(_typeUserSearch);
              setState(() {});
            },
            child: const Icon(
              Icons.location_city,
              size: 50,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
              height: double.infinity,
              fit: BoxFit.cover,
              'assets/images/bg_images.jpg'),
          const Positioned(
            top: 130,
            left: 150,
            child: Text(
              '🌦 ',
              style: TextStyle(fontSize: 70, color: AppColors.white),
            ),
          ),
          Positioned(
            top: 150,
            left: 50,
            child: Text('$_temp\u00B0  ', style: AppTextStyles.textWhite100),
          ),
          Positioned(
            top: 400,
            right: 30,
            child: Text('''
             ass
             asa
             asa
             asas
              ''', style: AppTextStyles.textWhite35W400),
          ),
          Positioned(
            top: 650,
            right: 130,
            child: Text(
              _cityName,
              style: AppTextStyles.textWhite50W800,
            ),
          ),
        ],
      ),
    );
  }
}
