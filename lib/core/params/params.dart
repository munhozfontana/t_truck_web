import 'package:equatable/equatable.dart';
import 'package:t_truck_web/features/login/data/models/dasboard_model.dart';
import 'package:t_truck_web/features/login/domain/entities/token_entity.dart';

class Params extends Equatable {
  final LoginModel? loginParam;
  final TokenEntity? tokenParam;

  const Params({this.loginParam, this.tokenParam});

  @override
  List<Object> get props => [];
}
