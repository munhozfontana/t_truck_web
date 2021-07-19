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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MenuModel &&
        other.icon == icon &&
        other.text == text &&
        other.route == route;
  }

  @override
  int get hashCode => icon.hashCode ^ text.hashCode ^ route.hashCode;
}
