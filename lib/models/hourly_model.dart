import 'package:flutter/material.dart';
import 'package:weather_app/models/icon_handler.dart';

class HourlyForecastModel {
  final String time;
  final String temperature;
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
      temperature: json['temp_c'] != null
          ? double.parse(json['temp_c']).round().toString()
          : 'N/A',
      condition: json['condition']['text'] ?? 'Unknown',
      icon: iconFinder((json['condition']['text'])),
    );
  }
}
