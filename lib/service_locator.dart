import 'package:get_it/get_it.dart';
import 'package:weather_app/Data/remote_data_source.dart';
import 'package:weather_app/Data/repository_impl.dart';
import 'package:weather_app/Domain/repository.dart';
import 'package:weather_app/Domain/use_case.dart';
import 'package:weather_app/Presentation/bloc/weather_bloc.dart';


final getIt = GetIt.instance;

void init() {

  getIt.registerSingleton<WeatherRemoteDataSource>(
    WeatherRemoteDataSourceImpl(),
  );


  getIt.registerSingleton<WeatherRepo>(
    WeatherRepoImpl(getIt<WeatherRemoteDataSource>()) as WeatherRepo,
  );


  getIt.registerSingleton<FetchWeatherUseCase>(
    FetchWeatherUseCase(getIt<WeatherRepo>()),
  );
  getIt.registerSingleton<GetCityWeather>(
    GetCityWeather(getIt<WeatherRepo>()),
  );


  getIt.registerSingleton<WeatherBloc>(
    WeatherBloc(getIt<FetchWeatherUseCase>(),
      getIt<GetCityWeather>(),

    ),
  );
}
