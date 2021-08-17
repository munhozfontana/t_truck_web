// Mocks generated by Mockito 5.0.11 from annotations
// in t_truck_web/test/features/home/ui/home_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart'
    as _i4;
import 'package:t_truck_web/core/error/failures.dart' as _i8;
import 'package:t_truck_web/core/params/params.dart' as _i10;
import 'package:t_truck_web/core/utils/app_dialog.dart' as _i3;
import 'package:t_truck_web/features/home/domain/entities/dash_board_entity.dart'
    as _i9;
import 'package:t_truck_web/features/home/domain/entities/location_entity.dart'
    as _i12;
import 'package:t_truck_web/features/home/domain/use_cases/protocols/i_list_dashboard_case.dart'
    as _i6;
import 'package:t_truck_web/features/home/domain/use_cases/protocols/i_list_location_case.dart'
    as _i11;
import 'package:t_truck_web/routes/app_routes_enum.dart' as _i5;

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

/// A class which mocks [IAppDialog].
///
/// See the documentation for Mockito's code generation for more information.
class MockIAppDialog extends _i1.Mock implements _i3.IAppDialog {
  MockIAppDialog() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void show({String? menssagem}) =>
      super.noSuchMethod(Invocation.method(#show, [], {#menssagem: menssagem}),
          returnValueForMissingStub: null);
  @override
  void error({String? menssagem}) =>
      super.noSuchMethod(Invocation.method(#error, [], {#menssagem: menssagem}),
          returnValueForMissingStub: null);
}

/// A class which mocks [IMenuComponentController].
///
/// See the documentation for Mockito's code generation for more information.
class MockIMenuComponentController extends _i1.Mock
    implements _i4.IMenuComponentController {
  MockIMenuComponentController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void addQuickAcces(_i5.Routes? menuModel) =>
      super.noSuchMethod(Invocation.method(#addQuickAcces, [menuModel]),
          returnValueForMissingStub: null);
  @override
  void onTapMenu(_i5.Routes? newMenuModel) =>
      super.noSuchMethod(Invocation.method(#onTapMenu, [newMenuModel]),
          returnValueForMissingStub: null);
}

/// A class which mocks [IListDashboardCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockIListDashboardCase extends _i1.Mock
    implements _i6.IListDashboardCase {
  MockIListDashboardCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, _i9.DashBoardComposedEntity>> call(
          _i10.Params? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
          returnValue: Future<
                  _i2.Either<_i8.Failure, _i9.DashBoardComposedEntity>>.value(
              _FakeEither<_i8.Failure, _i9.DashBoardComposedEntity>())) as _i7
          .Future<_i2.Either<_i8.Failure, _i9.DashBoardComposedEntity>>);
}

/// A class which mocks [IListLocationCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockIListLocationCase extends _i1.Mock implements _i11.IListLocationCase {
  MockIListLocationCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i12.LocationEntity>>> call(
          _i10.Params? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
          returnValue:
              Future<_i2.Either<_i8.Failure, List<_i12.LocationEntity>>>.value(
                  _FakeEither<_i8.Failure, List<_i12.LocationEntity>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i12.LocationEntity>>>);
}
