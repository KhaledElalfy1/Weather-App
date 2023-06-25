
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/provider/weather_Provider.dart';

void main()
{
  runApp( ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: WeatherApp()

  )
  );
}

class WeatherApp extends StatelessWidget {
   WeatherApp({Key? key}) : super(key: key);
  WeatherModel? weatherProvider;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData ==null ? Colors.blue :Provider.of<WeatherProvider>(context).weatherData!.getColor()
    ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

