abstract class WeatherEvent {}

class FetchWeatherEvent extends WeatherEvent {}

class SearchCityEvent extends WeatherEvent{
  final String cityName;

  SearchCityEvent(this.cityName);
}
