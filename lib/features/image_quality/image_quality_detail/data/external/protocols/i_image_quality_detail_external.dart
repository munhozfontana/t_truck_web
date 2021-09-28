import 'package:t_truck_web/features/image_quality/image_quality_detail/data/models/truck_driver_image_model.dart';

abstract class IImageQualityDetailExternal {
  Future<List<TruckDriverImageModel>> getById(int cod);
  Future<List<String>> getImageBtTruckDriverImage(
    TruckDriverImageModel truckDriverImageModel,
  );
}
