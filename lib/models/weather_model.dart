import 'package:weather_app/models/day_model.dart';
import 'package:weather_app/models/hourly_model.dart';

class WeatherModel {
  final String cityName;
  final String date;
  final String? imagePath;
  final double temperature;
  final double maxTemp;
  final double minTemp;
  final int humidity;
  final double windSpeed;
  final String winddirection;
  final int pressure;
  final int visibility;
  final double feelsLike;
  final String weatherCondition;
  final int uvIndex;
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
      temperature: json['current']['temp_c'].round().toDouble(),
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c']
          .round()
          .toDouble(),
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c']
          .round()
          .toDouble(),
      feelsLike: json['current']['feelslike_c'].round().toDouble(),
      humidity: json['current']['humidity'].toInt(),
      windSpeed: json['current']['wind_kph'].toDouble(),
      winddirection: json['current']['wind_dir'],
      pressure: json['current']['pressure_mb'].toInt(),
      visibility: json['current']['vis_km'].toInt(),
      uvIndex: json['current']['uv'].toInt(),
      hourlyForecast: hourlyForecast,
      fiveDayForecast: fiveDayForecast,
    );
  }
}
