// Mocks generated by Mockito 5.0.11 from annotations
// in t_truck_web/test/features/home/ui/home_controller_test.dart.
// Do not manually edit this file.

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:t_truck_web/core/adapters/map/map_entity.dart' as _i6;
import 'package:t_truck_web/core/error/failures.dart' as _i5;
import 'package:t_truck_web/core/params/params.dart' as _i7;
import 'package:t_truck_web/core/utils/app_dialog.dart' as _i8;
import 'package:t_truck_web/features/home/domain/repositories/i_map_repository.dart'
    as _i2;
import 'package:t_truck_web/features/home/domain/use_cases/map_use_case.dart'
    as _i4;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeIMapRepository extends _i1.Fake implements _i2.IMapRepository {}

class _FakeEither<L, R> extends _i1.Fake implements _i3.Either<L, R> {
  @override
  String toString() => super.toString();
}

/// A class which mocks [MapUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockMapUseCase extends _i1.Mock implements _i4.MapUseCase {
  MockMapUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IMapRepository get iMapRepository =>
      (super.noSuchMethod(Invocation.getter(#iMapRepository),
          returnValue: _FakeIMapRepository()) as _i2.IMapRepository);
  @override
  _i3.Either<_i5.Failure, _i6.MapEntity> call(_i7.Params? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue: _FakeEither<_i5.Failure, _i6.MapEntity>())
          as _i3.Either<_i5.Failure, _i6.MapEntity>);
}

/// A class which mocks [AppDialog].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppDialog extends _i1.Mock implements _i8.AppDialog {
  MockAppDialog() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void show({String? titulo, String? menssagem}) => super.noSuchMethod(
      Invocation.method(#show, [], {#titulo: titulo, #menssagem: menssagem}),
      returnValueForMissingStub: null);
  @override
  void error({String? titulo, String? menssagem}) => super.noSuchMethod(
      Invocation.method(#error, [], {#titulo: titulo, #menssagem: menssagem}),
      returnValueForMissingStub: null);
}