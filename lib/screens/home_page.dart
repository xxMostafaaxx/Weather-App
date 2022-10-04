import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  void updateui()
  {
    setState(() {

    });


}
WeatherModel?weatherData;
  @override
  Widget build(BuildContext context) {
     weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions:  [
         IconButton(onPressed: ()
         {
           Navigator.push(
               context,
           MaterialPageRoute(builder: (context)=>  Search_Page(updateUi:updateui,))
           );
         },
             icon: const Icon(
                 Icons.search
             ),
         )
        ],

        title: const Text(
            'Weather App',

        ),
      ),
      body:weatherData==null?Center(

        child: Column(

          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'There is no weather start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height:20 ,
            ),
            Text(
              'Searching now ?? 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      )
          :
      //ELSE
      Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
              colors:[
                weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[300]!,
                weatherData!.getThemeColor()[200]!,
                weatherData!.getThemeColor()[100]!,
                weatherData!.getThemeColor()[50]!,
              ],
                  begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        padding: const EdgeInsets.only(top: 150),
        width: double.infinity,
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
             Text(
               weatherData!.name.toString(),
            style: const TextStyle(
              fontSize: 30,
              fontWeight:FontWeight.bold
            ),),
            const SizedBox(
              height: 15,
            ),
            Text(
              weatherData!.country.toString(),
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight:FontWeight.w500
              ),),
            const SizedBox(
              height: 15,
            ),
             Text('Updated : ${weatherData!.date}',
              style: const TextStyle(
                  fontSize: 20,

              ),),
            const SizedBox(
              height: 100,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('${weatherData!.getImage()}',height: 100,width: 100,),
                 Text(
                  "${weatherData!.temp.toInt()}",
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight:FontWeight.bold
                  ),),
                Column(
                  children:  [
                    Text(
                       "MaxTemp :${weatherData!.maxtemp.toInt()} "
                    ),
                    Text(
                        "MinTemp : ${weatherData!.mintemp.toInt()}"),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 100,
            ),
             Text(
              weatherData!.weatherStateName ,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight:FontWeight.bold
              ),),

          ],
        ),
      ),
    );
  }
}
