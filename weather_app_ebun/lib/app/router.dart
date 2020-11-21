import 'package:weather_app/app/home/home_view.dart';
import 'package:weather_app/app/sign_in/signin_view.dart';
import 'package:weather_app/app/sign_up/signup_view.dart';
import 'package:weather_app/app/weather/weather_view.dart';
import 'package:weather_app/app/weather_details/weather_details_view.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SignInViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignInView(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );

    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );

    case WeatherViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: WeatherView(),
      );

    case WeatherDetailsViewRoute:
      var daily = settings.arguments as Daily;

      return _getPageRoute(
        routeName: settings.name,
        viewToShow: WeatherDetailsView(daily: daily),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
