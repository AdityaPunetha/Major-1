import 'package:flutter/material.dart';

final glowBoxShadow = [
  BoxShadow(
    color: const Color.fromARGB(255, 239, 239, 239).withOpacity(0.4),
    blurRadius: 6.0,
    spreadRadius: 3.0,
    offset: const Offset(
      0.0,
      3.0,
    ),
  ),
];

class RoutingBase {
  static const apiUrl = "http://127.0.0.1:8000";
}

class RoutingBalance extends RoutingBase {
  static const documents = "${RoutingBase.apiUrl}/document/";
  static const chat = "${RoutingBase.apiUrl}/chat/";
}
