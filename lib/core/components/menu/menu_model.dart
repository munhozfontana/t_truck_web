import 'package:flutter/cupertino.dart';

class MenuModel {
  final IconData? icon;
  final String text;
  final String route;
  final bool? iconInverted;

  MenuModel({
    this.icon,
    required this.text,
    required this.route,
    this.iconInverted = false,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MenuModel &&
        other.icon == icon &&
        other.text == text &&
        other.route == route &&
        other.iconInverted == iconInverted;
  }

  @override
  int get hashCode {
    return icon.hashCode ^
        text.hashCode ^
        route.hashCode ^
        iconInverted.hashCode;
  }
}
