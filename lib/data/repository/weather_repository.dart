import 'dart:math';
import 'package:weathersearch/models/network_error.dart';
import 'package:weathersearch/models/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeather(String cityName);
  Future<Weather> fetchDetailedWeather(String cityName);

}

class FakeWeatherRepository implements WeatherRepository {
  double cachedTempCelsius;

  @override
  Future<Weather> fetchDetailedWeather(String cityName) {
    // TODO: implement fetchDetailedWeather
    return Future.delayed(
      Duration(seconds: 1),
        (){
          return Weather(
              cityName: cityName,
              temperatureCelsius: cachedTempCelsius,
              temperatureFahrenheit: cachedTempCelsius * 1.8 + 32
          );
      }
    );
  }

  @override
  Future<Weather> fetchWeather(String cityName) {
    // TODO: implement fetchWeather
    return Future.delayed(
        Duration(seconds: 1),
        (){
          final random = Random();

          //simula um erro de internet
          if(random.nextBool()){
            throw NetworkError();
          }

          //simulando
          cachedTempCelsius = 20% random.nextInt(15) + random.nextDouble();
          return Weather(cityName: cityName, temperatureCelsius: cachedTempCelsius);
        }


    );
  }
}

