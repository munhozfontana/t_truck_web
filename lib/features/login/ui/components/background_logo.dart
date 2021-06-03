import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundLogo extends StatelessWidget {
  const BackgroundLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        child: SvgPicture.asset(
          'images/background_logo.svg',
          semanticsLabel: 'Background Logo',
        ),
      ),
    );
  }
}
