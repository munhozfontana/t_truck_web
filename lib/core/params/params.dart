import 'package:equatable/equatable.dart';
import 'package:t_truck_web/features/chat/domain/entities/chat_message_entity.dart';
import 'package:t_truck_web/features/config/domain/entities/config_entity.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/data/models/truck_driver_image_model.dart';
import 'package:t_truck_web/features/login/data/models/dasboard_model.dart';
import 'package:t_truck_web/features/login/domain/entities/token_entity.dart';

class Params extends Equatable {
  final int? id;
  final LoginModel? loginParam;
  final TokenEntity? tokenParam;
  final ConfigEntity? configEntity;
  final ChatMessage? chatMessageEntity;
  final String? idUser;
  final TruckDriverImageModel? truckDriverImageModel;

  const Params({
    this.id,
    this.loginParam,
    this.tokenParam,
    this.configEntity,
    this.chatMessageEntity,
    this.idUser,
    this.truckDriverImageModel,
  });

  @override
  List<Object> get props => [];
}
