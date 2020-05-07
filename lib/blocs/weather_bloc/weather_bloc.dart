import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weathersearch/data/repository/weather_repository.dart';
import 'package:weathersearch/models/network_error.dart';
import 'package:weathersearch/models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final WeatherRepository repository;

  WeatherBloc(this.repository);

  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    yield WeatherLoading();
    if(event is GetWeather){
      try{
        final weather = await repository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather);
      }on NetworkError{
        yield WeatherError("Erro de conexão");
      }
    }else if(event is GetDetailedWeather){
      try{
        final weather = await repository.fetchDetailedWeather(event.cityName);
        yield WeatherLoaded(weather);
      }on NetworkError{
        yield WeatherError("Erro de conexão");
      
    }

  }
}
