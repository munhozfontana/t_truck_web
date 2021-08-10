import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardEntity {
  final IconData icon;
  final String quantity;
  final String description;
  final Color colorIcon;
  final bool inverted;

  DashBoardEntity({
    this.icon = Icons.refresh,
    this.quantity = '',
    this.description = '',
    this.colorIcon = Colors.transparent,
    this.inverted = false,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DashBoardEntity &&
        other.icon == icon &&
        other.quantity == quantity &&
        other.description == description &&
        other.colorIcon == colorIcon &&
        other.inverted == inverted;
  }

  @override
  int get hashCode {
    return icon.hashCode ^
        quantity.hashCode ^
        description.hashCode ^
        colorIcon.hashCode ^
        inverted.hashCode;
  }
}

class DashBoardComposedEntity {
  DashBoardEntity finished;
  DashBoardEntity pending;
  DashBoardEntity opened;
  DashBoardEntity devolutions;

  static DashBoardEntity defaultData = DashBoardEntity(
      colorIcon: Colors.red,
      description: '',
      icon: Icons.flutter_dash,
      quantity: '');

  DashBoardComposedEntity({
    required this.finished,
    required this.pending,
    required this.opened,
    required this.devolutions,
  });
}
