import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/features/config/data/external/protocols/i_config_external.dart';
import 'package:t_truck_web/features/config/domain/entities/config_entity.dart';

class ConfigExternal implements IConfigExternal {
  IHttp iHttp;

  ConfigExternal({
    required this.iHttp,
  });

  @override
  Future<void> save(ConfigEntity obj) {
    try {
      // var res = await iHttp.postHttp(
      //     'http://truck.stoatacadista.com.br:2302/api/config',
      //     body: {
      //       "dataInicio": "",
      //       "dataFim": "",
      //     });

      // var resExtract = DioDriver.listExtract(res);

      return Future.value(null);
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
