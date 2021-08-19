import 'package:t_truck_web/features/config/domain/entities/config_entity.dart';

mixin IConfigExternal {
  Future<void> save(ConfigEntity obj);
}
