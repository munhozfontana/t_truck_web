mixin ILoggedUser {
  Future<String> get login;
  Future<String> get token;
  Future<void> saveToken(String token);
  Future<bool> loginExpired();
  void logout();
}
