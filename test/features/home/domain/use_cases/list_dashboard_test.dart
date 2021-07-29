import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/home/domain/entities/dash_board_entity.dart';
import 'package:t_truck_web/features/home/domain/repositories/i_dashboard_repository.dart';
import 'package:t_truck_web/features/home/domain/use_cases/list_dashboard_case.dart';

import 'list_dashboard_test.mocks.dart';

@GenerateMocks([IDasboadRepository])
void main() {
  late ListDashboardCase listDashboardCase;
  late IDasboadRepository iDasboadRepository;
  late DashBoardComposedEntity tValue;

  setUp(() {
    iDasboadRepository = MockIDasboadRepository();
    tValue = DashBoardComposedEntity();
    listDashboardCase = ListDashboardCase(
      iDasboadRepository: iDasboadRepository,
    );
  });

  test('should return without errors', () async {
    when(iDasboadRepository.get())
        .thenAnswer((realInvocation) => Future.value(Right(tValue)));
    final res = await listDashboardCase(const Params());
    expect(res.isRight(), isTrue);
  });

  test('objects should be equals', () async {
    when(iDasboadRepository.get())
        .thenAnswer((realInvocation) => Future.value(Right(tValue)));
    final res = await listDashboardCase(const Params());
    expect(res.fold((l) => l, (r) => r), tValue);
  });
}
