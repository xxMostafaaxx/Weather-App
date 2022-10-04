import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class Search_Page extends StatelessWidget {
  String? cityName;
Search_Page({this.updateUi});
  VoidCallback? updateUi;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.indigo,
        title: const Text(
            'Search a City',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(

          child: TextFormField(
            onChanged: (value)
            {
              cityName=value;
            },

            onFieldSubmitted: (value)async
            {
              print(value);
              cityName=value;
              WeatherServices service=WeatherServices();

              WeatherModel? weather =await service.getWeather(cityName: cityName!);
            Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;

            Navigator.pop(context);
            },
            decoration:  InputDecoration(

              contentPadding: const EdgeInsets.all(36),
              suffixIcon:GestureDetector(

                onTap: ()async
                {
                  WeatherServices service=WeatherServices();

                  WeatherModel? weather =await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;

                  Navigator.pop(context);
                },
                child:
                const Icon(Icons.search,color:Colors.indigo),
              ) ,

              border: const OutlineInputBorder(),
              labelText: 'Search',
              hintText: "Enter City"
            ),

          ),


        ),


      ),

    );
  }
}
