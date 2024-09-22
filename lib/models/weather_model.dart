import 'package:weather_app/models/day_model.dart';
import 'package:weather_app/models/hourly_model.dart';

class WeatherModel {
  final String cityName;
  final String date;
  final String? imagePath;
  final String temperature;
  final String maxTemp;
  final String minTemp;
  final String humidity;
  final String windSpeed;
  final String winddirection;
  final String pressure;
  final String visibility;
  final String feelsLike;
  final String weatherCondition;
  final String uvIndex;
  final List<HourlyForecastModel> hourlyForecast;
  final List<DayModel> fiveDayForecast;
  WeatherModel({
    required this.weatherCondition,
    required this.cityName,
    required this.date,
    this.imagePath,
    required this.temperature,
    required this.maxTemp,
    required this.minTemp,
    required this.humidity,
    required this.windSpeed,
    required this.winddirection,
    required this.pressure,
    required this.visibility,
    required this.feelsLike,
    required this.uvIndex,
    required this.hourlyForecast,
    required this.fiveDayForecast,
  });

  factory WeatherModel.fromJson(json) {
    List<DayModel> fiveDayForecast = (json['forecast']['forecastday'] as List)
        .map((dayForecast) => DayModel.fromJson(dayForecast))
        .toList();

    List<HourlyForecastModel> hourlyForecast =
        (json['forecast']['forecastday'][0]['hour'] as List)
            .map((hourJson) => HourlyForecastModel.fromJson(hourJson))
            .toList();
    return WeatherModel(
      cityName: json['location']['name'],
      date: json['current']['last_updated'],
      weatherCondition: json['current']['condition']['text'],
      temperature: double.parse(json['current']['temp_c']).round().toString(),
      maxTemp:
          double.parse(json['forecast']['forecastday'][0]['day']['maxtemp_c'])
              .round()
              .toString(),
      minTemp:
          double.parse(json['forecast']['forecastday'][0]['day']['mintemp_c'])
              .round()
              .toString(),
      feelsLike:
          double.parse(json['current']['feelslike_c']).round().toString(),
      humidity: int.parse(json['current']['humidity']).toString(),
      windSpeed: double.parse(json['current']['wind_kph']).toString(),
      winddirection: json['current']['wind_dir'],
      pressure: int.parse(json['current']['pressure_mb']).toString(),
      visibility: int.parse(json['current']['vis_km']).toString(),
      uvIndex: int.parse(json['current']['uv']).toString(),
      hourlyForecast: hourlyForecast,
      fiveDayForecast: fiveDayForecast,
    );
  }
}
