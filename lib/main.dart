import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/styles/styles_button.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';
import 'package:t_truck_web/core/styles/styles_inputs.dart';
import 'package:t_truck_web/features/login/ui/login_page.dart';
import 'package:t_truck_web/main_biding.dart';

void main() async {
  runApp(GetMaterialApp(
    title: 'GSA',
    theme: ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Color(0xFFFBFBFB),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: StylesButton.defaultButton,
      ),
      buttonTheme: ButtonThemeData(height: 56, minWidth: 200),
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
    initialRoute: '/',
    getPages: [
      GetPage(
        name: '/',
        page: () => LoginPage(),
      ),
    ],
  ));
}
