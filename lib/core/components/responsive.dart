import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isNotMobile(BuildContext context) => !isMobile(context);

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isNotTablet(BuildContext context) => !isTablet(context);

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static bool isNotDesktop(BuildContext context) => !isDesktop(context);

  static T when<T>(
    BuildContext context, {
    T? desktop,
    T? tablet,
    T? mobile,
    required T orOther,
  }) {
    if (isDesktop(context)) {
      return desktop ?? orOther;
    }
    if (isTablet(context)) {
      return tablet ?? orOther;
    }
    if (isMobile(context)) {
      return mobile ?? orOther;
    }
    return orOther;
  }

  static Widget whenWidget(
    BuildContext context, {
    Widget? desktop,
    Widget? tablet,
    Widget? mobile,
  }) {
    if (isDesktop(context)) {
      return desktop ?? tablet ?? mobile ?? Container();
    }
    if (isTablet(context)) {
      return tablet ?? mobile ?? desktop ?? Container();
    }
    if (isMobile(context)) {
      return mobile ?? tablet ?? desktop ?? Container();
    }
    return desktop ?? tablet ?? mobile ?? Container();
  }

  static dynamic whenWidgetDy(
    BuildContext context, {
    dynamic desktop,
    dynamic tablet,
    dynamic mobile,
  }) {
    if (isDesktop(context)) {
      return desktop ?? tablet ?? mobile ?? Container();
    }
    if (isTablet(context)) {
      return tablet ?? mobile ?? desktop ?? Container();
    }
    if (isMobile(context)) {
      return mobile ?? tablet ?? desktop ?? Container();
    }
    return desktop ?? tablet ?? mobile ?? Container();
  }

  static int all(BuildContext context, int? value) {
    return value ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop;
        } else if (constraints.maxWidth >= 650) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
