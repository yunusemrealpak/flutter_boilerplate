import 'package:flutter/material.dart';

class LocalizationManager {
  static final LocalizationManager _instance = LocalizationManager._internal();

  List<Locale> supportedLocales = const <Locale>[
    Locale('en'),
    Locale('tr'),
  ];

  factory LocalizationManager() {
    return _instance;
  }

  LocalizationManager._internal();
}
