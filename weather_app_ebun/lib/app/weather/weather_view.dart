import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_app/app/weather/weather_view_model.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:jiffy/jiffy.dart';

class WeatherView extends StatefulWidget {
  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  void initState() {
    super.initState();
  }

  var _random = new Random();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<WeatherViewModel>.withConsumer(
      viewModelBuilder: () => WeatherViewModel(),
      onModelReady: (model) => model.getWeatherData(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.blackShade1,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.blackShade1,
          title: Text(model.location ?? "City Screen"),
          leading: IconButton(
            icon: Icon(Icons.keyboard_return, color: AppColors.white),
            onPressed: model.navigateToHome,
          ),
          actions: [
            Center(
              child: InkWell(
                onTap: model.signOut,
                child: Icon(
                  Icons.cancel,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 10)
          ],
        ),
        body: model.busy
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: model.weatherData.daily.length,
                itemBuilder: (context, index) {
                  Daily data = model.weatherData.daily[index];

                  DateTime dateTime =
                      DateTime.fromMillisecondsSinceEpoch(data.dt * 1000);

                  return InkWell(
                    onTap: () => model.navigateToWeatherDetails(index),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.white,
                             
                            )
                          ],
                          //gradient color fixtures
                          gradient: new LinearGradient(
                              colors: [Colors.grey[800], Colors.grey[800]]),
                          color: AppColors.blue_light,
                          borderRadius: BorderRadius.circular(5.0)),
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Column(
                        children: [
                          Text("${Jiffy(dateTime).format('MMM do yy')}",
                              style: TextStyle(
                                fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 20.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Min Temp",
                                        style: TextStyle(color: Colors.white)),
                                    SizedBox(height: 10.0),
                                    Text("Max Temp",
                                        style: TextStyle(color: Colors.white)),
                                    SizedBox(height: 10.0),
                                    Text("Wind Speed",
                                        style: TextStyle(color: Colors.white)),
                                    SizedBox(height: 10.0),
                                    Text("Cloud Percentage",
                                        style: TextStyle(color: Colors.white)),
                                    SizedBox(height: 10.0),
                                    Text("Humidity Level",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("${data.temp.min} °C",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10.0),
                                    Text("${data.temp.max} °C",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10.0),
                                    Text("${data.windSpeed} km/h",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10.0),
                                    Text("${data.clouds} %",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10.0),
                                    Text("${data.humidity}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
