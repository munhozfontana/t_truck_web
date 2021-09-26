import 'package:t_truck_web/features/image_quality/domain/entities/image_quality_entity.dart';

abstract class IImageQualityExternal {
  Future<List<ImageQualityEntity>> get();
}
