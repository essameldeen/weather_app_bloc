import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/weatherEvents/weatherEvents.dart';
import 'package:weather_app_bloc/bloc/weatherState/weather_state.dart';
import 'package:weather_app_bloc/model/weather.dart';

class WeatherBloc extends Bloc<WeatherEvents, WeatherState> {
  WeatherBloc(InitialWeatherState initialState) : super(initialState);
  Weather weather = Weather(cityName: "", temperature: 0.0);

  WeatherState get initialState => InitialWeatherState();

  static WeatherBloc get(BuildContext context) => BlocProvider.of(context);

  Stream<WeatherState> mapEventToState(WeatherEvents events) async* {
    if (events is GetWeatherEvent) {
      // to show progress indicator in ui
      yield WeatherLoading();
      weather = await _fetchDataFromApi(events.name);
      yield SuccessWeatherState(weather);
    }
  }

  Future<Weather> _fetchDataFromApi(String name) async {
    // delay for imagine that i call web service (apis)
    return Future.delayed(Duration(seconds: 1), () {
      return Weather(
          cityName: name,
          temperature: 20 + Random().nextInt(10) + Random().nextDouble());
    });
  }
}
