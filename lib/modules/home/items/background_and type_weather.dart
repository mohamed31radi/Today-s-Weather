import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_to_day/modules/home/items/floating_button.dart';
import 'package:weather_to_day/shared/constant/constant.dart';
import 'package:weather_to_day/shared/network/remote/api_manger.dart';

import '../../../models/weather_response.dart';
import 'list_five_days.dart';

class Background_Weather extends StatelessWidget {
  String backgroundImages = "${ConstantApp.IMAGE}b_weather.png";
  String iconImages = '${ConstantApp.IMAGE}b_cloudy.png';
  bool xButton = false;
  WeatherResponse weatherResponse;

  Background_Weather({required this.weatherResponse});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundImages,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: Icon(Icons.arrow_forward_ios, color: Colors.black),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Colors.grey)),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: Icon(Icons.search, color: Colors.grey),
                          hintText: '     Search for your location...',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.only(top: 10)))),
            ),
          ),
          floatingActionButton: FloutingButton(),
          body: Column(
            children: [
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .width * .30),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(width: MediaQuery
                    .of(context)
                    .size
                    .width * .11),
                Expanded(
                  child: Column(
                    children: [
                      Text(weatherResponse.main?.temp.toString() ?? "0",
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                      Text(weatherResponse.weather?.first.main ?? "no data",
                          style: TextStyle(color: Colors.white, fontSize: 30))
                    ],
                  ),
                ),
                Image.asset(
                  iconImages,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .60,
                )
              ]),
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .width * .15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ListItem(),
                    SizedBox(width: 8),
                    ListItem(),
                    SizedBox(width: 8),
                    ListItem(),
                    SizedBox(width: 8),
                    ListItem(),
                    SizedBox(width: 8),
                    ListItem(),
                  ],
                ),
              ),
              SizedBox(height: 88),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(15)), color: Colors.white
                      ),
                      width: 180,
                      height: 45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.settings_sharp, size: 30),
                          Icon(Icons.location_on_outlined, size: 30),
                          SizedBox(width: 4),

                        ],
                      )

                  ),
                  SizedBox(width: 30),

                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
