import 'package:flutter/material.dart';
import 'package:t_truck_web/core/adapters/drivers/dio_driver.dart';
import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/icons/menu_icons_icons.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/features/home/data/external/protocols/i_dashboard_external.dart';
import 'package:t_truck_web/features/home/domain/entities/dash_board_entity.dart';

class DashboardExternal implements IDashboardExternal {
  IHttp iHttp;

  DashboardExternal({
    required this.iHttp,
  });

  @override
  Future<DashBoardComposedEntity> get() async {
    try {
      var res = await iHttp.postHttp(
          'http://truck.stoatacadista.com.br:2302/api/dadosLogistico',
          body: {
            "dataInicio": "",
            "dataFim": "",
          });

      var resExtract = DioDriver.listExtract(res);

      return DashBoardComposedEntity(
        finished: DashBoardEntity(
          quantity: resExtract[0]['CONCLUIDOS'].toString(),
          description: 'Concluído',
          icon: Icons.done,
          colorIcon: const Color(0xFF45D36D),
        ),
        devolutions: DashBoardEntity(
          quantity: resExtract[0]['DEVOLUCOES'].toString(),
          description: 'Devoluções',
          icon: MenuIcons.subdirectory_arrow_right,
          colorIcon: const Color(0xFF2050FA),
          inverted: true,
        ),
        opened: DashBoardEntity(
          quantity: resExtract[0]['ABERTOS'].toString(),
          description: 'Em aberto',
          icon: Icons.view_in_ar_outlined,
          colorIcon: Colors.black,
        ),
        pending: DashBoardEntity(
          quantity: '?',
          description: 'Pendentes',
          icon: Icons.info_outline,
          colorIcon: StylesColors.wellow,
        ),
      );
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
