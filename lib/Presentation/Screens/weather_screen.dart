import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:weather_app/Presentation/bloc/weather_bloc.dart';
import 'package:weather_app/Presentation/bloc/weather_event.dart';
import 'package:weather_app/Presentation/bloc/weather_state.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherBloc>(context).add(FetchWeatherEvent());
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF73C8A9), Color(0xFF373B44)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Center(child:  Text('Weather App', style: TextStyle(color: Colors.deepPurple)))
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    hintText: 'Enter city name',
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.search, color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF52796F),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      BlocProvider.of<WeatherBloc>(context).add(SearchCityEvent(value));
                    }
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherInitial) {
                      return const Center(child: Text('Enter a city name to fetch weather data.', style: TextStyle(color: Colors.white)));
                    } else if (state is WeatherLoading) {
                      return const Center(child: CircularProgressIndicator(color: Colors.white));
                    } else if (state is CityWeatherState) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFF5f72be), Color(0xFF9b23ea)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'City: ${state.city.localizedName}',
                                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                    Text(
                                      'Country: ${state.city.country!.localizedName ?? 'no name'}',
                                      style: const TextStyle(fontSize: 18, color: Colors.white),
                                    ),
                                    Text(
                                      'Latitude: ${state.city.geoPosition?.latitude ?? 'no available'}',
                                      style: const TextStyle(fontSize: 18, color: Colors.white),
                                    ),
                                    Text(
                                      'Longitude: ${state.city.geoPosition?.longitude ?? 'no available'}',
                                      style: const TextStyle(fontSize: 18, color: Colors.white),
                                    ),
                                    Text(
                                      'Elevation: ${state.city.geoPosition?.elevation?.metric?.value ?? ''} ${state.city.geoPosition?.elevation?.metric?.unit ?? ''}',
                                      style: const TextStyle(fontSize: 18, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      );
                    } else if (state is WeatherLoaded) {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            margin: const EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF36d1dc), Color(0xFF5b86e5)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.weatherResponse.headline.text,
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                Text(
                                  'Effective Date: ${DateFormat.yMMMMEEEEd().format(DateTime.parse(state.weatherResponse.headline.effectiveDate))}',
                                  style: const TextStyle(fontSize: 16, color: Colors.white),
                                ),
                                Text(
                                  'Severity: ${state.weatherResponse.headline.severity}',
                                  style: const TextStyle(fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.weatherResponse.dailyForecasts.length,
                              itemBuilder: (context, index) {
                                final forecast = state.weatherResponse.dailyForecasts[index];
                                return Container(
                                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF2a5298), Color(0xFF1e3c72)],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 2),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        DateFormat.yMMMMEEEEd().format(DateTime.parse(forecast.date)),
                                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                      Text(
                                        'Min Temp: ${forecast.temperature.minimum.value} ${forecast.temperature.minimum.unit}',
                                        style: const TextStyle(fontSize: 16, color: Colors.white),
                                      ),
                                      Text(
                                        'Max Temp: ${forecast.temperature.maximum.value} ${forecast.temperature.maximum.unit}',
                                        style: const TextStyle(fontSize: 16, color: Colors.white),
                                      ),
                                      Text(
                                        'Day: ${forecast.day.iconPhrase}',
                                        style: const TextStyle(fontSize: 16, color: Colors.white),
                                      ),
                                      Text(
                                        'Night: ${forecast.night.iconPhrase}',
                                        style: const TextStyle(fontSize: 16, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    } else if (state is WeatherError) {
                      return Center(child: Text('Error: ${state.message}', style: const TextStyle(color: Colors.white)));
                    } else {
                      return const Center(child: Text('Unexpected state', style: TextStyle(color: Colors.white)));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
