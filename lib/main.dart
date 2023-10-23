import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (ctx) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) => MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: getMaterialColor(
                  BlocProvider.of<GetWeatherCubit>(ctx)
                      .weatherModel
                      ?.weatherCondition),
            ),
            home: const MyHomePage(),
          ),
        );
      }),
    );
  }
}

MaterialColor getMaterialColor(String? condition) {
  if (condition == null) {
    return Colors.lightBlue;
  }
  switch (condition) {
    case "Sunny":
      return Colors.yellow;

    case "Partly cloudy":
      return Colors.orange;

    case "Cloudy":
    case "Overcast":
    case "Mist":
    case "Fog":
    case "Freezing fog":
    case "Patchy rain possible":
    case "Patchy snow possible":
    case "Patchy sleet possible":
    case "Patchy freezing drizzle possible":
      return Colors.grey;

    case "Patchy light drizzle":
    case "Light drizzle":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Patchy light rain":
    case "Light rain":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
      return Colors.lightBlue;

    case "Blowing snow":
    case "Blizzard":
    case "Patchy light snow":
    case "Light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
      return Colors.blueGrey;

    case "Thundery outbreaks possible":
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.deepPurple;

    case "Ice pellets":
      return Colors.lightBlue;

    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
      return Colors.grey;

    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.lightBlue;

    default:
      return Colors.lightBlue; // Default color for unknown weather
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SearchPage()));
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NOWeatherDataState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            // ignore: prefer_const_constructors
            return WeatherData(
              weatherModel: state.weatherModel,
            );
          } else {
            return const Center(
              child: Text("Opps we have an error, please try again later"),
            );
          }
        },
      ),
    );
  }
}
