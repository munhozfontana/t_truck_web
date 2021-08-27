import 'package:t_truck_web/features/chat/domain/entities/chat_person_entity.dart';

abstract class IChatPeopleExternal {
  Future<List<ChatPerson>> listByToken(int perfil);
}
