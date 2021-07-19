import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_web/core/adapters/map/map_entity.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/home/domain/repositories/i_map_repository.dart';
import 'package:t_truck_web/features/home/domain/use_cases/map_use_case.dart';

import 'map_use_case_test.mocks.dart';

@GenerateMocks([IMapRepository])
void main() {
  late MapUseCase mapUseCase;
  late IMapRepository mockIMapRepository;

  setUp(() {
    mockIMapRepository = MockIMapRepository();
    mapUseCase = MapUseCase(iMapRepository: mockIMapRepository);
  });

  test('should call map_use_case without erros', () {
    when(mockIMapRepository.init()).thenAnswer(
      (realInvocation) => Right(
        MapEntity(
          map: Container(),
        ),
      ),
    );
    final res = mapUseCase(const Params());
    expect(res.isRight(), isTrue);
  });
}
