import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/core/utils/app_dialog.dart';
import 'package:t_truck_web/features/config/domain/entities/config_entity.dart';
import 'package:t_truck_web/features/config/domain/usecases/protocols/i_save_config_case.dart';

class ConfigController extends GetxController {
  ISaveConfigCase iSaveConfigCase;

  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  ConfigController({required this.iSaveConfigCase});

  final nameField = TextEditingController().obs;
  final lastNameField = TextEditingController().obs;
  final emailField = TextEditingController().obs;

  Future<void> saveConfig() async {
    if (formKey.value.currentState!.validate()) {
      final configEntity = ConfigEntity(
        email: nameField.value.text,
        lastName: lastNameField.value.text,
        name: emailField.value.text,
      );
      (await iSaveConfigCase(Params(configEntity: configEntity))).fold(
        (l) => null,
        (r) {
          AppDialog().show(
            menssagem: "Configurações salvas com sucesso",
          );
        },
      );
    }
  }
}
