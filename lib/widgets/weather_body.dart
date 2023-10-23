import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({super.key, required this.weatherModel});
  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    var weatherdata = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getMaterialColor(weatherdata.weatherCondition),
            getMaterialColor(weatherdata.weatherCondition)[300]!,
            getMaterialColor(weatherdata.weatherCondition)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                weatherdata.city,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              Text(
                "Updated at ${stringToDateTime(weatherdata.date).hour}:${stringToDateTime(weatherdata.date).minute}",
                style:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // icon section
                  Image.network("https:${weatherdata.image}"),
                  // avrage temp section
                  Text(
                    "${weatherdata.temp}",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  //column for max temp and min temp
                  Column(
                    children: [
                      Text("max temp ${weatherdata.maxTemp.round()}"),
                      Text("min temp ${weatherdata.minTemp.round()}"),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                weatherdata.weatherCondition,
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}

DateTime stringToDateTime(String value) {
  return DateTime.parse(value);
}
