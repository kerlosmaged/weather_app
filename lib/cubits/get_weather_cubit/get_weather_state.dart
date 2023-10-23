import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class NOWeatherDataState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
}

class WeatherUnLoadedState extends WeatherState {}
