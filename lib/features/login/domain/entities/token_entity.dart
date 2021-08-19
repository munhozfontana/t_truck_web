class TokenEntity {
  final String token;
  final DateTime createAt;
  final Map? descripted;

  TokenEntity({
    required this.token,
    required this.createAt,
    this.descripted,
  });

  factory TokenEntity.fromMap(Map<String, dynamic> map) {
    return TokenEntity(
      token: map['token'] as String,
      createAt: DateTime.now(),
    );
  }
}
