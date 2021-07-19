import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_web/core/adapters/map/i_map_adp.dart';
import 'package:t_truck_web/core/adapters/map/map_entity.dart';
import 'package:t_truck_web/core/error/driver_exception.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/home/data/repository_impl/map_repository.dart';

import 'map_repository_test.mocks.dart';

@GenerateMocks([IMapAdp])
void main() {
  late MapRepository mapRepository;
  late MockIMapAdp mockIMapAdp;

  setUp(() {
    mockIMapAdp = MockIMapAdp();
    mapRepository = MapRepository(iMapAdap: mockIMapAdp);
  });

  test('should return obj without erros', () {
    when(mockIMapAdp.init()).thenAnswer(
      (realInvocation) => MapEntity(
        map: Container(),
      ),
    );
    final res = mapRepository.init();
    expect(res.isRight(), isTrue);
  });
  test('should return [DriverFailure] ', () {
    when(mockIMapAdp.init()).thenThrow(DriverException());
    final res = mapRepository.init();
    expect(res.isLeft(), isTrue);
    expect(res.fold((l) => l, (r) => r), isA<DriverFailure>());
  });
  test('should return [AppFailure] ', () {
    when(mockIMapAdp.init()).thenThrow(Exception());
    final res = mapRepository.init();
    expect(res.isLeft(), isTrue);
    expect(res.fold((l) => l, (r) => r), isA<AppFailure>());
  });
}
