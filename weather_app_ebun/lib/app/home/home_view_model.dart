import 'package:geocoding/geocoding.dart';
import 'package:weather_app/app/base/base_model.dart';
import 'package:weather_app/constants/route_names.dart';
import 'package:weather_app/app/locator.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:weather_app/services/navigation_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  // SharedPreferences prefs;

  WeatherData weatherData;

  Future submitCityLocation(String location) async {
    List<Location> locations =await locationFromAddress(location);
    // List<Location> locations =await locationFromAddress("Gronausestraat 710, Enschede");
    double lat = locations.first.latitude;
    double lng = locations.first.longitude;
    print({location, lat, lng});
    storeLocation(location, lat, lng);
    navigateToWeatherScreen();
  }

  Future storeLocation(String location, double lat, double lng) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('WA_LOCATION', location);
    prefs.setDouble('WA_LAT', lat);
    prefs.setDouble('WA_LNG', lng);

    print({location, lat, lng});
  }

  Future navigateToWeatherScreen() async {
    await _navigationService.navigateTo(WeatherViewRoute);
  }
}
