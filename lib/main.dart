import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/screens/weather_screen.dart';
import 'package:weather_app_bloc/shared/bloc_delegate.dart';

void main() {
  Bloc.observer = AppBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Demo Bloc',
      theme: ThemeData(

        primarySwatch: Colors.teal,
      ),
      home:WeatherScreen()
    );
  }
}

