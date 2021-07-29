import 'package:flutter/material.dart';
import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/icons/menu_icons_icons.dart';
import 'package:t_truck_web/features/home/domain/entities/dash_board_entity.dart';

mixin IDashboardExternal {
  Future<DashBoardComposedEntity> get();
}

class DashboardExternal implements IDashboardExternal {
  IHttp iHttp;

  DashboardExternal({
    required this.iHttp,
  });

  @override
  Future<DashBoardComposedEntity> get() async {
    try {
      // var res = await iHttp.getHttp(
      //   '${dotenv.env['URL_BASE']}/dashboards',
      // );

      return DashBoardComposedEntity(
        finished: DashBoardEntity(
          quantity: '231',
          description: 'Concluído',
          icon: Icons.done,
          colorIcon: const Color(0xFF45D36D),
        ),
        devolutions: DashBoardEntity(
          quantity: '8',
          description: 'Devoluções',
          icon: MenuIcons.subdirectory_arrow_right,
          colorIcon: const Color(0xFF2050FA),
          inverted: true,
        ),
        opened: DashBoardEntity(
          quantity: '24',
          description: 'Em aberto',
          icon: Icons.view_in_ar_outlined,
          colorIcon: Colors.black,
        ),
        pending: DashBoardEntity(
          quantity: '11',
          description: 'Pendentes',
          icon: Icons.info_outline,
          colorIcon: const Color(0xFFF4CE49),
        ),
      );
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
