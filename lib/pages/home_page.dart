
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_screen.dart';
import 'package:weather_app/provider/weather_Provider.dart';
class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  WeatherModel?currentWeather;
  @override
  Widget build(BuildContext context) {
    currentWeather= Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather app'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return  SearchScreen();
            },
            )
            );
          },
              icon: const Icon(Icons.search))
        ],
      ),
      body:currentWeather == null? Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children:   [
              const Spacer(flex: 2,),
              const CircleAvatar(
                backgroundImage:AssetImage('assets/images/Weather-pana.png') ,
                radius: 120,
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300,65),

                ),


                  onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return  SearchScreen();
                },));
              }, child: const Text('Weather of the day',
                style: TextStyle(
                  fontSize: 20
                ),
              )
              ),
              const Spacer(flex: 5,)
            ],
          ),
        ),
      ) :Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              currentWeather!.getColor(),
              currentWeather!.getColor()[300]!,
              currentWeather!.getColor()[100]!,

            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            Text(Provider.of<WeatherProvider>(context).cityName!,
              style:const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),

            ),
            Text(currentWeather!.date.toString(),
              style:const TextStyle(
                  fontSize: 25,
              ),
            ),
            const Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(currentWeather!.getImage()),
                Text('${currentWeather!.temp.toInt()}',
                  style:  const TextStyle(
                    fontSize: 25,

                  ),
                ),
                Column(
                  children: [
                    Text('MaxTemp: ${currentWeather!.maxTemp.toInt()}',
                      style: const TextStyle(
                        fontSize:15,

                      ),),
                    Text('MinTemp: ${currentWeather!.minTemp.toInt()}',
                      style:const TextStyle(
                        fontSize: 15,

                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(flex: 1),
            Text(currentWeather!.weatherStateName,
              style:const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
            const Spacer(flex: 5),
          ],



        ),
      ),
    );
  }
}
