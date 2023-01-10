import 'dart:developer';
import 'package:flutter/material.dart';
import '../../utils/constans/app_colors/app_colors.dart';
import '../../utils/constans/text_styles/app_text_styles.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: AppColors.transparent,
            elevation: 0,
              leading: IconButton(
            onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios),
          )),
          body: Stack(children: [
            Image.asset(
                height: double.infinity,
                fit: BoxFit.cover,
                'images/bg_gif3.gif'),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: const TextStyle(fontSize: 35),
                      controller: _controller,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Shaardy izde',
                        hintStyle: const TextStyle(
                            fontSize: 18, color: AppColors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 3, color: AppColors.teal),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 3, color: AppColors.blue),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  OutlinedButton(
                      onPressed: ()  {
                       Navigator.pop(context,_controller.text);
                        FocusManager.instance.primaryFocus?.unfocus();
                        log('controller =====> ${_controller.text}');
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(0, 150, 136, 1), //<-- SEE HERE
                      ),
                      child: const Text(
                        'Shardy tap',
                        style: AppTextStyles.text40Black,
                      ))
                ],
              ),
            ),
          ])),
    );
  }
}
