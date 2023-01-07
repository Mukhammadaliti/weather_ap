import 'dart:developer';
import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:weather_app/app/presentation/pages/search_page.dart';
import 'package:weather_app/app/utils/constans/text_styles/app_text_styles.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import '../../utils/constans/app_colors/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _temp = '';
  String _cityName = '';
  String _description = '';
  String _icons = '';
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
    final position = await _getPosition();
    await getWeatherByLocation( position);
    log('position.latitude ====>${position.latitude} ');
    log('position.latitude ====>${position.longitude} ');
  }

  Future<Map<String, dynamic>> getWeatherByLocation (Position? position) async {
    try {
    final http = Client();
    setState(() {
      _ailanipAtat = true;
    });
    Uri uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat={position.latitude}&lon={position.longitude}&appid=597fd8840114926137baeebbb9f68dd5');
      var response = await http.get(uri);
      // if(response.statusCode == 200 || response.statusCode == 201){
      // final maalymat = jsonDecode(response.body);
      // final data = jsonDecode(jsonJoop) as Map <String, dynamic>;
      // final kelvin = data['main']['temp'] as num;
      // _cityName = data['name'];
        // 
      // }
      // log('jooop ====> ${response.data}');
      
    } catch (e) {
      setState(() {});
      throw Exception(e);
    } throw Exception();
  }

  Future<Position> _getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.only(left: 380),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
            },
            child: Icon(
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
              'images/bg_images.jpg'),
          const Positioned(
            top: 150,
            left: 50,
            child: Text('8°', style: AppTextStyles.textWhite35W400),
          ),
          Positioned(
            top: 145,
            left: 90,
            child: Text(
              '🌩',
              style: TextStyle(fontSize: 80),
            ),
          ),
          Positioned(
            top: 400,
            right: 20,
            child: Text(
              '''
                 Кочо суук болтат.
                 Жылуурак кийинип алыныз.
                 🧥🧣🧤
                ''',
              textAlign: TextAlign.center,
              style: AppTextStyles.textWhite35W400,
            ),
            //
          ),
          Positioned(
            top: 650,
            right: 130,
            child: Text(
              _cityName.toUpperCase(),
              style: AppTextStyles.textWhite35W400,
            ),
          ),
        ],
      ),
    );
  }
}
