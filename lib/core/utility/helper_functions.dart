import 'package:flutter/material.dart';

void customPrint({
  required String fromWhere,
  String? type,
  required String data,
}) {
  debugPrint(
    "👉 [ DEBUG PRINT ] [ $fromWhere ] ${type == null ? "" : " [ $type ] "} $data",
  );
}
