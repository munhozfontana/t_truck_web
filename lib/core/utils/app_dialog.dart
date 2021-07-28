import 'package:flutter/material.dart';
import 'package:get/get.dart';

Duration timeToDisabled = const Duration(seconds: 30);

mixin IAppDialog {
  void show({String? menssagem});
  void error({String? menssagem});
}

class AppDialog {
  void show({String? menssagem}) {
    Get.showSnackbar(GetBar(
      message: menssagem,
      duration: timeToDisabled,
      backgroundColor: Get.theme.primaryColor,
    ));
  }

  void error({String? menssagem}) {
    Get.showSnackbar(
      GetBar(
        message: menssagem,
        duration: timeToDisabled,
        backgroundColor: Colors.red[300]!,
      ),
    );
  }
}
