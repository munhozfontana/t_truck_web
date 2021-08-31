import 'package:logger/logger.dart';

class StringUtils {
  static String fisrtAndLastLatter(String name) {
    try {
      final iniciais = name
          .trim()
          .replaceAll(new RegExp(r'[^\w\s]+'), '')
          .split(" ")
          .map((e) => e[0])
          .join()
          .toUpperCase();
      return iniciais[0] +
          (iniciais.length > 1 ? iniciais[iniciais.length - 1] : "");
    } catch (e) {
      Logger().w('Erro ao converter a msg', e);
      return "";
    }
  }
}
