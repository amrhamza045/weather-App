import 'package:flutter/material.dart';
import 'package:weather_app/models/icon_handler.dart';

class HourlyForecastModel {
  final String time;
  final double temperature;
  final String condition;
  final Icon icon;

  HourlyForecastModel({
    required this.time,
    required this.temperature,
    required this.condition,
    required this.icon,
  });

  factory HourlyForecastModel.fromJson(dynamic json) {
    return HourlyForecastModel(
      time: json['time'] ?? 'N/A',
      temperature:
          json['temp_c'] != null ? json['temp_c'].round().toDouble() : 0.0,
      condition: json['condition']['text'] ?? 'Unknown',
      icon: iconFinder((json['condition']['text'])),
    );
  }
}
