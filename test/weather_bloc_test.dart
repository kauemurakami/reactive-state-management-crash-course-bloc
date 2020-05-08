import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weathersearch/blocs/weather_bloc/weather_bloc.dart';
import 'package:weathersearch/data/repository/weather_repository.dart';
import 'package:weathersearch/models/weather.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
  });

  group('GetWeather', () {
    final weather = Weather(cityName: 'London', temperatureCelsius: 7);

    test('OLD WAY emits []WeatherLoading, WeatherLoaded] when successful', () {
      when(mockWeatherRepository.fetchWeather(any))
          .thenAnswer((_) async => weather);

      final bloc = WeatherBloc(mockWeatherRepository);

      bloc.add(GetWeather('London'));

      expectLater(
          bloc,
          emitsInOrder([
            WeatherInitial(),
            WeatherLoading(),
            WeatherLoaded(weather),
          ]));
    });

    test('NEWER WAY BUT LONG-WINED emits []WeatherLoading, WeatherLoaded] when successful', () {
      when(mockWeatherRepository.fetchWeather(any))
          .thenAnswer((_) async => weather);

      final bloc = WeatherBloc(mockWeatherRepository);

      bloc.add(GetWeather('London'));

      expectLater(
          bloc,
          emitsInOrder([
            WeatherInitial(),
            WeatherLoading(),
            WeatherLoaded(weather),
          ]));
    });
  });
}
