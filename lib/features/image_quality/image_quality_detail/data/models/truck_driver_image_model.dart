import 'dart:convert';

import 'package:t_truck_web/features/image_quality/image_quality_detail/domain/entities/truck_driver_image_entity.dart';

class TruckDriverImageModel extends TruckDriverImageEntity {
  final int numCanhoto;
  final int codCLi;
  final String numTrasnvenda;
  final int codMotorista;

  TruckDriverImageModel({
    required String percentage,
    required this.numCanhoto,
    required this.codCLi,
    required this.numTrasnvenda,
    required this.codMotorista,
  }) : super(
          percentage: percentage,
        );

  factory TruckDriverImageModel.fromMap(Map<String, dynamic> map) {
    return TruckDriverImageModel(
      codCLi: map['CODCLI'] as int,
      numCanhoto: map['NUMCANHOTO'] as int,
      percentage: map['PERCENT_OCR'] as String,
      numTrasnvenda: map['NUMTRANSVENDA'] as String,
      codMotorista: map['CODMOTORISTA'] as int,
    );
  }

  factory TruckDriverImageModel.fromJson(String source) =>
      TruckDriverImageModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
