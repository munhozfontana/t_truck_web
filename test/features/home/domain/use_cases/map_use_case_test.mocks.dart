// Mocks generated by Mockito 5.0.11 from annotations
// in t_truck_web/test/features/home/domain/use_cases/map_use_case_test.dart.
// Do not manually edit this file.

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:t_truck_web/core/adapters/map/map_entity.dart' as _i5;
import 'package:t_truck_web/core/error/failures.dart' as _i4;
import 'package:t_truck_web/features/home/domain/repositories/i_map_repository.dart'
    as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither<L, R> extends _i1.Fake implements _i2.Either<L, R> {
  @override
  String toString() => super.toString();
}

/// A class which mocks [IMapRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIMapRepository extends _i1.Mock implements _i3.IMapRepository {
  MockIMapRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Either<_i4.Failure, _i5.MapEntity> init() =>
      (super.noSuchMethod(Invocation.method(#init, []),
              returnValue: _FakeEither<_i4.Failure, _i5.MapEntity>())
          as _i2.Either<_i4.Failure, _i5.MapEntity>);
}