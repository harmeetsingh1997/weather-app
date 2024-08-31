


import 'package:weather_app/Domain/city_entities.dart';
import 'package:weather_app/Domain/entities.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherResponseEntity weatherResponse;

  WeatherLoaded(this.weatherResponse);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}
class CityWeatherState extends WeatherState{
  final CityEntity city;

  CityWeatherState(this.city);
}
