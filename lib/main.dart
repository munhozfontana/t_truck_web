import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/features/home/ui/components/expanded_map_component.dart';

import 'core/styles/styles_button.dart';
import 'core/styles/styles_fonts.dart';
import 'core/styles/styles_inputs.dart';
import 'features/home/home_biding.dart';
import 'features/home/ui/home_page.dart';
import 'features/login/ui/login_page.dart';
import 'main_biding.dart';

Future<void> main() async {
  const durationTransitionsPages = Duration(milliseconds: 1000);
  runApp(GetMaterialApp(
    title: 'GSA',
    theme: ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFFBFBFB),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: StylesButton.defaultButton,
      ),
      buttonTheme: const ButtonThemeData(height: 56, minWidth: 200),
      inputDecorationTheme: StylesInputs.defaultInput(),
      textTheme: TextTheme(
        headline1: StylesTypography.h24,
        headline2: StylesTypography.h18,
        headline3: StylesTypography.h16,
        headline4: StylesTypography.h16W400,
        headline5: StylesTypography.h14,
      ),
    ),
    initialBinding: MainBiding(),
    initialRoute: '/home',
    getPages: [
      GetPage(
        name: '/',
        page: () => const LoginPage(),
      ),
      GetPage(
        name: '/home',
        transitionDuration: durationTransitionsPages,
        page: () => const HomePage(),
        binding: HomeBiding(),
      ),
      GetPage(
        transitionDuration: durationTransitionsPages,
        name: '/home/mapa',
        page: () => const ExpandedMapComponent(),
      ),
    ],
  ));
}
