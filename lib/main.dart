import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathersearch/routes/routes.dart';
import 'blocs/weather_bloc/weather_bloc.dart';
import 'data/repository/weather_repository.dart';
import 'screens/android/weather_page/weather_search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.ROUTE_ROOT,
      title: 'Weather App',
      home: BlocProvider(
        builder: (context) => WeatherBloc(FakeWeatherRepository()),
        child: WeatherSearchPage(),
      ),
    );
  }
}