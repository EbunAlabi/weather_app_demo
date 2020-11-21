import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/app/home/home_view_model.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:provider_architecture/provider_architecture.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.blackShade1,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 16.0),
                  SizedBox(height: 16.0),
                  Text("Search Weather Data ",
                      style: TextStyle(color: Colors.white, fontSize: 24.0)),
                  SizedBox(height: 36.0),
                  TextFormField(
                    controller: cityController,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                      hintText: "Enter City",
                      hintStyle: TextStyle(fontSize: 18.0),
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.all(12.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.white, width: 0.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      filled: true,
                      fillColor: AppColors.grey,
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () => model.submitCityLocation(cityController.text),
                    child: Container(
                        height: 40.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(50.0)),
                        child: Center(child: Text("Search City"))),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
