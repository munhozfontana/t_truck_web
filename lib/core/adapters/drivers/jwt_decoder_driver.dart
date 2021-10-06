import 'package:jwt_decoder/jwt_decoder.dart';

import '../../error/driver_exception.dart';
import '../protocols/i_jwt_external.dart';

class JwtDecoderDriver implements IJwt {
  @override
  Map jwtDecode(String token) {
    try {
      return JwtDecoder.decode(token);
    } catch (e) {
      throw DriverException(error: 'Error ao decodificar o jwt');
    }
  }

  @override
  bool isExpired(String token) {
    try {
      final decodeToken = JwtDecoder.decode(token);
      if (DateTime.now().millisecondsSinceEpoch >=
          (decodeToken['exp'] as num) * 1000) {
        return true;
      }
      return false;
    } catch (e) {
      throw DriverException(error: 'Error ao recuperar expriração do jwt');
    }
  }
}
