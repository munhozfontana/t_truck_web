import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';

Duration timeToDisabled = const Duration(seconds: 30);

abstract class IAppDialog {
  void show({String? menssagem});
  void error({String? menssagem});
  void warning({String? menssagem});
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

  @override
  void warning({String? menssagem}) {
    Get.showSnackbar(GetBar(
      message: menssagem,
      duration: timeToDisabled,
      backgroundColor: StylesColors.wellow,
    ));
  }
}
