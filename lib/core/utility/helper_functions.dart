import 'package:flutter/material.dart';

void customPrint({
  required String fromWhere,
  required String data,
  String? type,
}) {
  debugPrint(
    "👉 [ DEBUG PRINT ] [ $fromWhere ] ${type == null ? "" : " [ $type ] "} $data",
  );
}
