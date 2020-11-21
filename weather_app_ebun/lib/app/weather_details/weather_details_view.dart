import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_app/app/weather_details/weather_details_view_model.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:jiffy/jiffy.dart';

class WeatherDetailsView extends StatefulWidget {
  final Daily daily;
  WeatherDetailsView({Key key, this.daily}) : super(key: key);

  @override
  _WeatherDetailsViewState createState() => _WeatherDetailsViewState();
}

class _WeatherDetailsViewState extends State<WeatherDetailsView> {
  @override
  void initState() {
    super.initState();
  }

  var _random = new Random();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<WeatherDetailsViewModel>.withConsumer(
      viewModelBuilder: () => WeatherDetailsViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.blackShade1,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.blackShade1,
          title: Text('Weather Details'),
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
        body: Builder(
          builder: (context) {
            Daily data = widget.daily;

            DateTime dateTime =
                DateTime.fromMillisecondsSinceEpoch(data.dt * 1000);

            

            return Container(
              height: 400,
              decoration: BoxDecoration(
                
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.white,

                    )
                  ],
                  gradient: new LinearGradient(
                      colors: [Colors.grey[800], Colors.grey[800]]),
                  color: AppColors.blue_light,
                  borderRadius: BorderRadius.circular(5.0)),
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text("${Jiffy(dateTime).format('MMM do yy')}",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 16.0),
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
                            SizedBox(height: 20.0),
                            Text("Max Temp",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 20.0),
                            Text("Pop",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 20.0),
                            Text("Rain",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 20.0),
                            Text("Wind Degree",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 20.0),
                            Text("Dew Point",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 20.0),
                            Text("Cloud Percentage",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 20.0),
                            Text("Humidity Level",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 20.0),
                            Text("Wind Speed",
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
                            SizedBox(height: 20.0),
                            Text("${data.temp.max} °C",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 20.0),
                            Text("${data.pop} PoP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 20.0),
                            Text("${data.rain} inch",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 20.0),
                            Text("${data.windDeg}°",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 20.0),
                            Text("${data.dewPoint} F",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 20.0),
                            Text("${data.clouds} %",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 20.0),
                            Text("${data.humidity}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 20.0),
                            Text("${data.windSpeed} km/h",
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
            );
          },
        ),
      ),
    );
  }
}
