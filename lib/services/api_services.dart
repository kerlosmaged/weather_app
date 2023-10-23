import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  Dio dio;

  WeatherServices({required this.dio});

  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "c31cd2eb0595485a9b5102413230609";

  Future<WeatherModel> getWethearData({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException {
      rethrow;
    }
  }
}
