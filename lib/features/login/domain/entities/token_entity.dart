import 'package:t_truck_web/features/login/domain/entities/perfil_enum.dart';

class TokenEntity {
  final String token;
  final DateTime createAt;
  final PerfilEnum perfilEnum;
  final Map? descripted;

  TokenEntity({
    required this.token,
    required this.createAt,
    this.descripted,
    this.perfilEnum = PerfilEnum.none,
  });

  factory TokenEntity.fromMap(Map<String, dynamic> map) {
    return TokenEntity(
      token: map['token'] as String,
      createAt: DateTime.now(),
    );
  }
}
