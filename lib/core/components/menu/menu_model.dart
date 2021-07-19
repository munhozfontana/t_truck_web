import 'package:flutter/cupertino.dart';

class MenuModel {
  final IconData? icon;
  final String text;
  final String route;

  MenuModel({
    this.icon,
    required this.text,
    required this.route,
  });
}
