import 'package:flutter/material.dart';

class AppFlavorConfig {
  late String flavor;
  late String title;
  bool debugShowCheckedModeBanner;
  ThemeData? theme;

  AppFlavorConfig({
    required this.flavor,
    required this.title,
    this.debugShowCheckedModeBanner = true,
    this.theme,
  });
}
