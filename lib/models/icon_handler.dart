import 'package:flutter/material.dart';

Icon iconFinder(String weatherCondition) {
  switch (weatherCondition) {
    case 'clear':
      return const Icon(Icons.wb_sunny);
    case 'clouds':
      return const Icon(Icons.cloud);
    case 'rain':
      return const Icon(Icons. beach_access);
    case 'snow':
      return const Icon(Icons.ac_unit);
    default:
      return const Icon(Icons.wb_sunny);
  }

}