import 'dart:convert';

import 'package:t_truck_web/features/image_quality/image_quality_list/domain/entities/image_quality_entity.dart';

class ImageQualityModel extends ImageQualityEntity {
  ImageQualityModel({
    required int cod,
    required String name,
    required String percent,
    required int badQuality,
  }) : super(
          cod: cod,
          name: name,
          overallPercentage: percent,
          badQuality: badQuality,
        );

  factory ImageQualityModel.fromMap(Map<String, dynamic> map) {
    return ImageQualityModel(
      cod: map['CODMOTORISTA'] as int,
      name: map['NOME'] as String,
      percent: (map['MEDIA'] as num).toStringAsFixed(2),
      badQuality: map['QTDE'] as int,
    );
  }

  factory ImageQualityModel.fromJson(String source) =>
      ImageQualityModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
