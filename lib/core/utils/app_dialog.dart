import 'package:flutter/material.dart';
import 'package:get/get.dart';

Duration timeToDisabled = const Duration(seconds: 30);

abstract class IAppDialog {
  void show({String? menssagem});
  void error({String? menssagem});
}

class AppDialog implements IAppDialog {
  @override
  void show({String? menssagem}) {
    Get.showSnackbar(GetBar(
      message: menssagem,
      duration: timeToDisabled,
      backgroundColor: Get.theme.primaryColor,
    ));
  }

  @override
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
