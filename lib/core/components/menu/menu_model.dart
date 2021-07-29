import 'package:flutter/cupertino.dart';

class MenuModel {
  final IconData? icon;
  final String text;
  final String path;
  final bool? iconInverted;

  MenuModel({
    this.icon,
    required this.text,
    required this.path,
    this.iconInverted = false,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MenuModel &&
        other.icon == icon &&
        other.text == text &&
        other.path == path &&
        other.iconInverted == iconInverted;
  }

  @override
  int get hashCode {
    return icon.hashCode ^
        text.hashCode ^
        path.hashCode ^
        iconInverted.hashCode;
  }
}
