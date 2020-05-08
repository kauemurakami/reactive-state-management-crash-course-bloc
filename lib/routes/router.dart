import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathersearch/blocs/weather_bloc/weather_bloc.dart';
import 'package:weathersearch/models/weather.dart';
import 'package:weathersearch/screens/android/weather_page/weather_search_page.dart';
import 'package:weathersearch/screens/android/weather_page_detail/weather_detail_page.dart';
part 'routes.dart';

class Router{

    static Route<dynamic> routeGenerator(RouteSettings settings) {
      switch (settings.name) {
        case RouteList.ROUTE_ROOT :
          return MaterialPageRoute(
            builder: (_) => WeatherSearchPage()
          );
  
        case RouteList.ROUTE_WEATHER_DETAILS:
        final Weather weather = settings.arguments; 
          return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: BlocProvider.of<WeatherBloc>(context),
              child: WeatherDetailPage(
                masterWeather: weather,
              ),
            ),
          );
      }
    }
  }
  