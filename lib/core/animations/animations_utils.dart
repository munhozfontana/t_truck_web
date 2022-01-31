import 'package:flutter/cupertino.dart';

class AnimationsUtils {
  Animation<double> animateDouble({
    required double begin,
    required double end,
    required Animation<double> parent,
    Curve? curve,
  }) {
    return Tween<double>(begin: begin, end: end).animate(
      CurvedAnimation(
        parent: parent,
        curve: curve ?? Curves.decelerate,
      ),
    );
  }

  Animation<Color?> animateColor({
    required Color begin,
    required Color end,
    required Animation<double> parent,
  }) {
    return ColorTween(begin: begin, end: end).animate(
      CurvedAnimation(
        parent: parent,
        curve: Curves.decelerate,
      ),
    );
  }

  List<Color> animatedColorList({
    required List<Color> begin,
    required List<Color> end,
    required Animation<double> parent,
  }) {
    return begin.asMap().entries.map((entry) {
      return animateColor(
        begin: entry.value,
        end: end[entry.key],
        parent: parent,
      ).value!;
    }).toList();
  }
}
