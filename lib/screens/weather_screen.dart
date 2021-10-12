import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/weatherBloc/weatherBloc.dart';
import 'package:weather_app_bloc/bloc/weatherState/weather_state.dart';
import 'package:weather_app_bloc/model/weather.dart';
import 'package:weather_app_bloc/widgets/build_colum_with_data_widget.dart';
import 'package:weather_app_bloc/widgets/city_input_widget.dart';
import 'package:weather_app_bloc/widgets/progress_indecator_widget.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen();

  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(InitialWeatherState()),
      child: BlocConsumer<WeatherBloc, WeatherState>(
          builder: (BuildContext context, WeatherState weatherState) {
        Weather weather = WeatherBloc.get(context).weather;
        return Scaffold(
          appBar: AppBar(
            title: Text("Weather App Demo"),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            child: _mapToContentState(weatherState, weather),
          ),
        );
      }, listener: (BuildContext context, WeatherState state) {
        if (state is WeatherLoading) {
          print("loading State");
        }
        if (state is SuccessWeatherState) {
          print("success State");
        }
        if (state is ErrorWeatherState) {
          print("error State");
        }
      }),
    );
  }

  Widget _mapToContentState(WeatherState weatherState, Weather weather) {
    if (weatherState is InitialWeatherState) {
      return CityInputField();
    } else if (weatherState is WeatherLoading) {
      return ProgressIndicatorWidget();
    } else if (weatherState is SuccessWeatherState) {
      return ColumnWithData(weather);
    } else {
      return ErrorWidget("Error Happen");
    }
  }
}
