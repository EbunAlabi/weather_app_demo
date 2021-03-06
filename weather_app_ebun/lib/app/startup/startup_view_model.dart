import 'dart:async';

import 'package:weather_app/constants/route_names.dart';
import 'package:weather_app/app/locator.dart';
import 'package:weather_app/services/navigation_service.dart';
import 'package:weather_app/app/base/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  bool hasLoggedInUser = false;

  Future handleStartUpLogic() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      hasLoggedInUser = prefs.getBool('WA_isLoggenIn');
      print("try: " + hasLoggedInUser.toString());
    } catch (e) {
      hasLoggedInUser = false;
      print("caught: " + hasLoggedInUser.toString());
    }

    if (hasLoggedInUser != null && hasLoggedInUser) {
      _navigationService.navigateReplacementTo(WeatherViewRoute);
    } else {
      _navigationService.navigateReplacementTo(SignInViewRoute);
    }
  }
}
