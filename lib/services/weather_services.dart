import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherServices
{
  String baseUrl='http://api.weatherapi.com/v1';
  String apiKey='0e12cff15da341a2b0e31146232206';

  Future<WeatherModel?> getCityName({required String cityName}) async
  {
    WeatherModel? weatherObj;
    try{
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);

       weatherObj = WeatherModel.fromJason(data);
    }
    catch(e)
    {
      print(e);
    }
    return weatherObj;
  }

}