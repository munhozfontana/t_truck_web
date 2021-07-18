import 'package:flutter/material.dart';
import 'package:get/get.dart';

var timeToDisabled = Duration(seconds: 30);

class AppDialog {
  static void show({String? titulo, String? menssagem}) {
    Get.showSnackbar(GetBar(
      message: menssagem,
      duration: timeToDisabled,
      backgroundColor: Get.theme.primaryColor,
    ));
  }

  static void error({String? titulo, String? menssagem}) {
    Get.showSnackbar(
      GetBar(
        message: menssagem,
        duration: timeToDisabled,
        backgroundColor: Colors.red[300]!,
      ),
    );
  }
}
