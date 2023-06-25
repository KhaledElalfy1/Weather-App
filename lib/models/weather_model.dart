import 'package:flutter/material.dart';

class WeatherModel
{
   String date;
  String weatherStateName;
   double temp;
   double maxTemp;
   double minTemp;


  WeatherModel(
      {required this.date,
        required this.weatherStateName,
        required this.temp,
        required this.maxTemp,
        required this.minTemp});

 factory WeatherModel.fromJason(data)
  {
    var dayTemp= data['forecast']['forecastday'][0]['day'];
    // print(dayTemp);
    return WeatherModel(date: data['location']['localtime'],
        weatherStateName: dayTemp['condition']['text'],
        temp: dayTemp['avgtemp_c'],
        maxTemp: dayTemp['maxtemp_c'],
        minTemp: dayTemp['mintemp_c']);
  }
String getImage()
{
  if(weatherStateName=='Clear'||weatherStateName=='Light Cloud')
    {
      return 'assets/images/clear.png';
    }
  else if (weatherStateName=='Sleet'||weatherStateName=='Snow'||
      weatherStateName=='Hail')
    {
      return 'assets/images/snow.png';
    }
  else if (weatherStateName=='Heavy Cloud')
    {
      return 'assets/images/cloudy.png';
    }
  else if (weatherStateName=='Light Rain'||weatherStateName=='Heavy Rain'||
      weatherStateName=='Showers' || weatherStateName== 'Patchy rain possible' )
    {
      return 'assets/images/rainy.png';
    }
  else if (weatherStateName=='Thunderstorm' ||weatherStateName== 'Thunder')
    {
      return 'assets/images/thunderstorm.png';
    }
  else
    {
      return 'assets/images/clear.png';
    }

}

   MaterialColor getColor()
   {
     if(weatherStateName=='Clear'||weatherStateName=='Light Cloud')
     {
       return Colors.orange;
     }
     else if (weatherStateName=='Sleet'||weatherStateName=='Snow'||
         weatherStateName=='Hail')
     {
       return Colors.blue;
     }
     else if (weatherStateName=='Heavy Cloud')
     {
       return Colors.blueGrey;
     }
     else if (weatherStateName=='Light Rain'||weatherStateName=='Heavy Rain'||
         weatherStateName=='Showers' || weatherStateName== 'Patchy rain possible' )
     {
       return Colors.blue;
     }
     else if (weatherStateName=='Thunderstorm' ||weatherStateName== 'Thunder')
     {
       return Colors.blueGrey;
     }
     else
     {
       return Colors.orange;
     }

   }

}