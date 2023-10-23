import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/services/api_services.dart';

class SearchPage extends StatelessWidget {
  final weatherServices = WeatherServices(dio: Dio());

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Search"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: TextField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(overflow: TextOverflow.fade),
                    hintText: "Enter Your Location",
                    label: Text("Search"),
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(20),
                  ),
                  onSubmitted: (value) {
                    BlocProvider.of<GetWeatherCubit>(context)
                        .getWeather(cityName: value);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
