import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/enum/devolution_status_enum.dart';

class DevolutionsEntity {
  final int cod;
  final String client;
  final DevolutionStatus devolutionStatus;

  DevolutionsEntity({
    required this.cod,
    this.client = 'Sem informação',
    this.devolutionStatus = DevolutionStatus.none,
  });
}
