import 'dart:convert';

import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required String login,
    required String password,
  }) : super(
          login: login,
          password: password,
        );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'password': password,
    };
  }
}
