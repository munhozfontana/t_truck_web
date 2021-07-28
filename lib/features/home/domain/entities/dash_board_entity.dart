import 'package:flutter/cupertino.dart';

class DashBoardEntity {
  final IconData icon;
  final String quantity;
  final String description;
  final Color colorIcon;
  final bool inverted;

  DashBoardEntity({
    required this.icon,
    required this.quantity,
    required this.description,
    required this.colorIcon,
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

class DashBoardComposedEntit {
  DashBoardEntity? finished;
  DashBoardEntity? pending;
  DashBoardEntity? opened;
  DashBoardEntity? devolutions;

  DashBoardComposedEntit({
    this.finished,
    this.pending,
    this.opened,
    this.devolutions,
  });
}
