import 'package:equatable/equatable.dart';
import 'package:t_truck_web/features/config/domain/entities/config_entity.dart';
import 'package:t_truck_web/features/login/data/models/dasboard_model.dart';
import 'package:t_truck_web/features/login/domain/entities/token_entity.dart';

class Params extends Equatable {
  final LoginModel? loginParam;
  final TokenEntity? tokenParam;
  final ConfigEntity? configEntity;

  const Params({
    this.loginParam,
    this.tokenParam,
    this.configEntity,
  });

  @override
  List<Object> get props => [];
}
