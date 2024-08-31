

import 'dart:convert' ;
import 'package:http/http.dart' as http;
import 'package:weather_app/Data/city_model.dart';
import 'package:weather_app/Data/model.dart';



abstract class WeatherRemoteDataSource{

  Future<WeatherResponseModel>  fetchWeather();
  Future<CityModel> fetchCityWeather(String cityName);

}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource{


  @override
  Future<WeatherResponseModel> fetchWeather()async {
  final response = await http.get(Uri.parse('https://dataservice.accuweather.com/forecasts/v1/daily/5day/349727?apikey=pDkOQLz4Gv2kexPxYyXuKShrM0s0Rmmk'));
    if(response.statusCode==200){
      final data = jsonDecode(response.body);
      return WeatherResponseModel.fromJson(data);
    }
    else{
      throw Exception('failed to load data');
    }
  }

  @override
  Future<CityModel> fetchCityWeather(String cityName)async {
    Uri url = Uri.parse('https://dataservice.accuweather.com/locations/v1/cities/search?apikey=pDkOQLz4Gv2kexPxYyXuKShrM0s0Rmmk&q=$cityName');
    final response = await http.get(url);
    if(response.statusCode==200){
      final data= jsonDecode(response.body);
      return CityModel.fromJson(data[0]);
    }
    else{
      throw Exception('failed to load data');
    }
  }


  }


