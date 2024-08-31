
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Domain/city_entities.dart';
import 'package:weather_app/Domain/entities.dart';
import 'package:weather_app/Domain/use_case.dart';
import 'package:weather_app/Presentation/bloc/weather_event.dart';
import 'package:weather_app/Presentation/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final FetchWeatherUseCase fetchWeatherUseCase;
  final GetCityWeather getCityWeather;

  WeatherBloc(this.fetchWeatherUseCase, this.getCityWeather) : super(WeatherInitial()) {
    on<FetchWeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      try {
        final WeatherResponseEntity weatherResponse = await fetchWeatherUseCase.execute();
        emit(WeatherLoaded(weatherResponse));
      } catch (e) {
        emit(WeatherError(e.toString()));
      }
    });
    on<SearchCityEvent>((event, emit) async {
      try {
        final CityEntity city = await getCityWeather.call(event.cityName);
        emit(CityWeatherState(city));
      } catch (e) {
        emit(WeatherError(e.toString()));
      }
    });
  }
}
