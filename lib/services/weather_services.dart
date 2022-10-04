import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherServices
{
  Future<WeatherModel?> getWeather({required String cityName})async
  {
    WeatherModel? weatherData;
    try
    {
      String apiKey='1770269799a94037938133526222409';
      String baseUrl="http://api.weatherapi.com/v1";
      Uri url =Uri.parse ("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=3");

      http.Response response=await http.get(url);
      Map<String,dynamic> data =jsonDecode(response.body);
      weatherData=WeatherModel.fromjson(data);
    }catch(e){
      print(e);
    }
    return weatherData;




  }
}