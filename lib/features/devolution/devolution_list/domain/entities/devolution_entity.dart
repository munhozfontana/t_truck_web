import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/devolution_progress_status_enum.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/devolution_status_enum.dart';

class DevolutionEntity {
  final int cod;
  final String client;
  final DevolutionStatus status;
  final DevolutionProgressStatus devolutionProgressStatus;
  final DateTime data;

  DevolutionEntity({
    required this.cod,
    this.client = 'Sem informação',
    this.status = DevolutionStatus.none,
    required this.devolutionProgressStatus,
    required this.data,
  });
}
