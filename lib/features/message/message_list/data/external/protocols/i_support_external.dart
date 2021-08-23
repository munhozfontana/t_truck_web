import 'package:t_truck_web/features/message/message_list/domain/entities/support_entity.dart';

abstract class ISupportExternal {
  Future<List<SupportEntity>> get();
}
