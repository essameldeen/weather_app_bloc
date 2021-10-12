abstract class WeatherEvents{
  const WeatherEvents();

}

class GetWeatherEvent extends WeatherEvents{
  final String name;
  GetWeatherEvent(this.name);

}