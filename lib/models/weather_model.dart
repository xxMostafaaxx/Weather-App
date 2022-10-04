import 'dart:convert';

import 'package:flutter/material.dart';

class WeatherModel
{
  String name;
  String country;
  String date;
  double temp;
  double maxtemp;
  double mintemp;
  String weatherStateName;

  WeatherModel({
  required this.date,
    required this.name,
    required this.country,
  required this.temp,
  required this.maxtemp,
  required this.mintemp,
  required this.weatherStateName,
  });

factory WeatherModel.fromjson(dynamic data)
{
  return WeatherModel(
    name: data['location']['name'],
    country:data["location"]["country"],
      date: data['location']['localtime'],
      temp: data['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp:data['forecast']['forecastday'][0]['day']['maxtemp_c'] ,
      mintemp: data['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherStateName:data['forecast']['forecastday'][0]['day']['condition']['text'] ,

  );

}
  String getImage() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy') {
      return 'assets/images/sunny.png';
    } else if (

    weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else
    if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' || weatherStateName == 'Mist' ||
        weatherStateName == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }


  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ||  weatherStateName == 'partly cloudy') {
      return Colors.orange;
    } else if (

    weatherStateName == 'Blizzard' ||  weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||  weatherStateName == 'Heavy Cloud' || weatherStateName == 'Mist' || weatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}