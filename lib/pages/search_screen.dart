
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/services/weather_services.dart';

import '../models/weather_model.dart';
import '../provider/weather_Provider.dart';
class SearchScreen extends StatelessWidget {
   SearchScreen({super.key}) ;
   String ? cityName;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
          appBar: AppBar(

            backgroundColor: Colors.blue,
            // backgroundColor: const Color(0xffFFAC3A),
            title: const Text('Search a City'),
          ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: ListView(

            children: [
              const SizedBox(height: 100),
          const CircleAvatar(
          backgroundImage:AssetImage('assets/images/Weather-rafiki.png') ,
          radius: 120,
                  ),
              const SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: TextField(
                  onChanged: (data){
                    cityName=data;
                  },
                  onSubmitted: (text)async{
                    cityName = text;
                    WeatherServices services = WeatherServices();
                    WeatherModel? weatherState= await services.getCityName(cityName: cityName!);
                    Provider.of<WeatherProvider>(context,listen: false).weatherData=weatherState;
                    Provider.of<WeatherProvider>(context,listen: false).cityName=cityName;


                    Navigator.pop(context);
                  },
                  decoration:  InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 32),
                    label:const  Text('Search'),
                    suffixIcon: GestureDetector(
                      onTap: ()async
                      {
                        WeatherServices services = WeatherServices();
                        WeatherModel? weatherState= await services.getCityName(cityName: cityName!);
                        Provider.of<WeatherProvider>(context,listen: false).weatherData=weatherState;
                        Provider.of<WeatherProvider>(context,listen: false).cityName=cityName;


                        Navigator.pop(context);
                      },
                        child:const Icon(Icons.search
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none

                    ),
                    hintText: 'Enter city'
                  ),
                ),
              ),
              const Spacer(flex: 5,)
            ],
          ),
        ),
      ),
    );
  }
}
