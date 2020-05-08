import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weathersearch/blocs/weather_bloc/weather_bloc.dart';
import 'package:weathersearch/data/repository/weather_repository.dart';
import 'package:weathersearch/models/network_error.dart';
import 'package:weathersearch/models/weather.dart';

class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState> implements WeatherBloc{ }
void main() {
  MockWeatherBloc mockWeatherBloc;
  setUp((){
    mockWeatherBloc = MockWeatherBloc();
  });

  test('Example mocked BLoC test', (){
    whenListen(mockWeatherBloc, Stream.fromIterable([
      WeatherInitial(),
      WeatherLoading(),
      ]));
      expectLater(mockWeatherBloc, emitsInOrder([
      WeatherInitial(),
      WeatherLoading(),
      ]));
  });
}