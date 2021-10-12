import 'package:flutter/cupertino.dart';
import 'package:weather_app_bloc/model/weather.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class InitialWeatherState extends WeatherState {}


class WeatherLoading extends WeatherState {}

class SuccessWeatherState extends WeatherState {
  final Weather result;

  SuccessWeatherState(this.result);
}

class ErrorWeatherState extends WeatherState {
  final String messageError;
  ErrorWeatherState(this.messageError);
}
