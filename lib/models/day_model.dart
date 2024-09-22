import 'package:flutter/material.dart';
import 'package:weather_app/models/icon_handler.dart';

class DayModel {
  final String maxTemp;
  final String minTemp;
  final String condition;
  final Icon icon;

  DayModel({
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
    required this.icon,
  });

  factory DayModel.fromJson(dynamic json) {
    return DayModel(
      maxTemp: double.parse(json['day']['maxtemp_c']).round().toString(),
      minTemp: double.parse(json['day']['mintemp_c']).round().toString(),
      condition: json['condition']['text'] ?? 'Unknown',
      icon: iconFinder(json['day']['condition']['icon']),
    );
  }
}
