
import 'package:weather_app/Data/city_model.dart';
import 'package:weather_app/Data/remote_data_source.dart';
import 'package:weather_app/Domain/entities.dart';
import 'package:weather_app/Domain/repository.dart';

class WeatherRepoImpl implements WeatherRepo{
  final WeatherRemoteDataSource weatherRemoteDataSource;

  WeatherRepoImpl(this.weatherRemoteDataSource);
  @override
  Future<WeatherResponseEntity> fetchWeather() async {
   return await weatherRemoteDataSource.fetchWeather();
  }

  @override
  Future<CityModel> fetchCityWeather(String cityName)async {
   return await weatherRemoteDataSource.fetchCityWeather(cityName);
  }

}