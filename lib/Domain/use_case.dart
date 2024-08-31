

import 'package:weather_app/Domain/city_entities.dart';
import 'package:weather_app/Domain/entities.dart';
import 'package:weather_app/Domain/repository.dart';

class FetchWeatherUseCase {
  final WeatherRepo weatherRepo;

  FetchWeatherUseCase(this.weatherRepo);

  Future<WeatherResponseEntity> execute() async {
    try {
      final weatherResponse=  await weatherRepo.fetchWeather();
      return weatherResponse;
    } catch (error) {
      throw Exception('Failed to fetch weather data: $error');
    }
  }
}

class GetCityWeather {
  final WeatherRepo repo;

  GetCityWeather(this.repo);

  Future<CityEntity> call(String cityName) async {
    return await repo.fetchCityWeather(cityName);
  }
}
