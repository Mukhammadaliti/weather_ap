import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_app/app/data/services/get_city_name.dart';
import 'package:weather_app/app/data/services/get_weather_city.dart';
import 'package:weather_app/app/modules/home/controller/home_controller.dart';
import 'package:weather_app/app/modules/search/view/search_page.dart';
import 'package:weather_app/app/utils/api_keys.dart';
import '../../../data/services/geo_locatoin.dart';
import '../../../utils/constans/app_colors/app_colors.dart';
import '../../../utils/constans/text_styles/app_text_styles.dart';
import '../../../utils/weather_util.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    log('Build ====> ');
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.transparent,
        leading: IconButton(
          onPressed: () async {
            final typedCityName = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => SearchPage()),
                ));
            await GetCityName.getWeatherByCityName(typedCityName);
          },
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
              await GetCityName.getWeatherByCityName(_typeUserSearch);
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
          Container(
            child: null,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/bg_images.jpg'),
              ),
            ),
          ),
          if (_homeController.ailanipAtat == true)
            const Positioned(
              left: 150,
              top: 400,
              child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  )),
            )
          else
            Positioned(
              top: 150,
              left: 50,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('${_homeController.temp.value}\u00B0   ',
                          style: AppTextStyles.textWhite100),
                      Text(_homeController.icons.value,
                          style: AppTextStyles.textWhite100),
                    ],
                  ),
                ],
              ),
            ),
          Positioned(
            top: 400,
            right: 0,
            child: Text(_homeController.description.value,
                textAlign: TextAlign.center, style: AppTextStyles.text20Black),
          ),
          Positioned(
            top: 650,
            right: 130,
            child: Text(
              _homeController.cityName.value,
              style: AppTextStyles.textWhite50W800,
            ),
          ),
        ],
      ),
    );
  }
}
