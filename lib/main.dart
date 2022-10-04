import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/home_page.dart';
import 'package:weather_app/screens/search_page.dart';

void main() {
  runApp(
      ChangeNotifierProvider
    (
        create: (context)
          {
            return WeatherProvider();
          },
          child: const Weather_App()
      )
  );
}

class Weather_App extends StatelessWidget {
  const Weather_App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
        theme: ThemeData(
            primarySwatch: Provider.of<WeatherProvider>(context).weatherData ==null ?Colors.indigo:  Provider.of<WeatherProvider>(context).weatherData!.getThemeColor()
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage()
    );
  }
}


