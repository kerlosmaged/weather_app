class WeatherModel {
  String city;
  String date;
  String image;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherCondition;
  WeatherModel({
    required this.city,
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required  this.image,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['location']['name'],
      date: json['current']['last_updated'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
