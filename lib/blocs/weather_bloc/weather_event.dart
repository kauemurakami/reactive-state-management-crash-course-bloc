part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

//criando nossos eventos

class GetWeather extends WeatherEvent {
  
  final String cityName;
  const GetWeather(this.cityName);

  @override
  // TODO: implement props
  List<Object> get props => [cityName];
}

class GetDetailWeather extends WeatherEvent {
  
  final String cityName;

  const GetDetailWeather(this.cityName);

  @override
  // TODO: implement props
  List<Object> get props => [cityName];
}