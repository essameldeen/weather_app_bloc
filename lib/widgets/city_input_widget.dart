import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_bloc/bloc/weatherBloc/weatherBloc.dart';
import 'package:weather_app_bloc/bloc/weatherEvents/weatherEvents.dart';

class CityInputField extends StatelessWidget {
  const CityInputField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) {
          submitCityName(value, context);
        },
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(String cityName, BuildContext context) {
    WeatherBloc.get(context).add(GetWeatherEvent(cityName));
  }
}
