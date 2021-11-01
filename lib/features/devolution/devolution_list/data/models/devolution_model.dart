import 'dart:convert';

import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/devolution_entity.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/devolution_progress_status_enum.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/devolution_status_enum.dart';

class DevolutionModel extends DevolutionEntity {
  final String codClie;
  final int codMot;
  final int numNota;

  DevolutionModel({
    required int cod,
    required String client,
    required DevolutionStatus status,
    required DateTime data,
    required DevolutionProgressStatus devolutionProgressStatus,
    required this.codClie,
    required this.codMot,
    required this.numNota,
  }) : super(
          cod: cod,
          client: client,
          status: status,
          data: data,
          devolutionProgressStatus: devolutionProgressStatus,
        );

  factory DevolutionModel.fromMap(Map<String, dynamic> map) {
    final parse = DateTime.parse(map['DATA'] as String);
    return DevolutionModel(
      cod: map['NUMTRANSVENDA'] as int,
      client: map['CLIENTE'] as String,
      codClie: (map['CODCLI'] as int).toString(),
      status: devolutionDescByCod(
        map['SITUACAO'] as String,
      ),
      devolutionProgressStatus: devolutionProgressDescByCod(
        map['OCORRENCIA'] as String,
      ),
      data: parse,
      codMot: map['CODMOT'] as int,
      numNota: map['NUMNOTA'] as int,
    );
  }

  factory DevolutionModel.fromJson(String source) =>
      DevolutionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
