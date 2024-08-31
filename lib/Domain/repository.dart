
import 'package:weather_app/Domain/city_entities.dart';
import 'package:weather_app/Domain/entities.dart';

abstract class WeatherRepo {
  Future<WeatherResponseEntity> fetchWeather();
  Future<CityEntity> fetchCityWeather(String cityName);
}
