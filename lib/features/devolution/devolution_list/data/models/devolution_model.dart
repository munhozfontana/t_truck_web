import 'dart:convert';

import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/devolution_entity.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/devolution_status_enum.dart';

class DevolutionModel extends DevolutionEntity {
  DevolutionModel({
    required int cod,
    required String client,
    required DevolutionStatus status,
    required DateTime data,
  }) : super(
          cod: cod,
          client: client,
          status: status,
          data: data,
        );

  factory DevolutionModel.fromMap(Map<String, dynamic> map) {
    final parse = DateTime.parse(map['DATA'] as String);
    return DevolutionModel(
        cod: map['CODPROD'] as int,
        client: map['CLIENTE'] as String,
        status: DevolutionStatusUtils.descByCod(map['SITUACAO'] as String),
        data: parse);
  }

  factory DevolutionModel.fromJson(String source) =>
      DevolutionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
