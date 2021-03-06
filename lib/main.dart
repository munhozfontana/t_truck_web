import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/routes/app_routes.dart';

import 'core/components/layout_component.dart';
import 'core/styles/styles_button.dart';
import 'core/styles/styles_fonts.dart';
import 'core/styles/styles_inputs.dart';
import 'main_biding.dart';
import 'routes/app_routes_enum.dart';

Future<void> main() async {
  runApp(GetMaterialApp(
    enableLog: false,
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
    initialRoute: Routes.login.path,
    getPages: pages(),
    onUnknownRoute: (settings) => GetPageRoute(
      page: () => const LayoutComponent(
        child: Text('Não encontrado'),
      ),
    ),
  ));
}
