import 'package:flutter/material.dart';
import 'package:weather_app_bloc/model/weather.dart';
import 'package:weather_app_bloc/widgets/city_input_widget.dart';

class ColumnWithData extends StatelessWidget {
  final Weather weather;
   ColumnWithData(this.weather);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          weather.cityName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          weather.temperature.toStringAsFixed(1),
          style: TextStyle(fontSize: 80),
        ),
        CityInputField(),
      ],
    );
  }
}
