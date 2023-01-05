import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/app/presentation/pages/search_page.dart';
import 'package:weather_app/app/utils/constans/text_styles/app_text_styles.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../utils/constans/app_colors/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              'Ош'.toUpperCase(),
              style: AppTextStyles.textWhite35W400,
            ),
          ),
        ],
      ),
    );
  }
}
