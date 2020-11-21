import 'package:flutter/material.dart';
import 'package:weather_app/app/startup/startup_view.dart';
import 'package:weather_app/services/navigation_service.dart';
import 'package:weather_app/services/dialog_service.dart';
import 'managers/dialog_manager.dart';
import 'app/router.dart';
import 'app/locator.dart';
import 'package:weather_app/constants/colors.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primaryColor: AppColors.black,
      ),
      home: StartUpView(),
      onGenerateRoute: generateRoute,
    );
  }
}
