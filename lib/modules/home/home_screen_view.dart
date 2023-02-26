import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_to_day/base.dart';
import 'package:weather_to_day/modules/home/home_navigator.dart';
import 'package:weather_to_day/modules/home/home_screen_view_model.dart';
import 'package:weather_to_day/modules/home/items/background_and%20type_weather.dart';
import 'package:weather_to_day/shared/constant/constant.dart';
import 'package:weather_to_day/shared/network/remote/api_manger.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen, HomeViewModel>
    implements HomeNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
    HomeViewModel().getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: FutureBuilder(
        future: APIManger.getCurrentWeather(44.34, 10.99),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Stack(
              children: [
                Image.asset(
                  "${ConstantApp.IMAGE}b_weather.png",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                )
              ],
            );
          }
          return Background_Weather(
            weatherResponse: snapshot.data!,
          );
        },
      ),
    );
  }

  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }
}
