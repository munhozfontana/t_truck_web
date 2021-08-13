abstract class IJwt {
  Map jwtDecode(String token);
  bool isExpired(String token);
}
