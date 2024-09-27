import 'package:flutter/material.dart';
import 'package:weather_app/models/icon_handler.dart';

class DayModel {
  final double maxTemp;
  final double minTemp;
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
      maxTemp: json['day']['maxtemp_c'].round().toDouble(),
      minTemp: json['day']['mintemp_c'].round().toDouble(),
      condition: json['day']['condition']['text'] ?? 'Unknown',
      icon: iconFinder(json['day']['condition']['text']),
    );
  }
}
