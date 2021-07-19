// Mocks generated by Mockito 5.0.11 from annotations
// in t_truck_web/test/features/home/data/repository_impl/map_repository_test.dart.
// Do not manually edit this file.

import 'package:mockito/mockito.dart' as _i1;
import 'package:t_truck_web/core/adapters/map/i_map_adp.dart' as _i3;
import 'package:t_truck_web/core/adapters/map/map_entity.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeMapEntity extends _i1.Fake implements _i2.MapEntity {}

/// A class which mocks [IMapAdp].
///
/// See the documentation for Mockito's code generation for more information.
class MockIMapAdp extends _i1.Mock implements _i3.IMapAdp {
  MockIMapAdp() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MapEntity init() => (super.noSuchMethod(Invocation.method(#init, []),
      returnValue: _FakeMapEntity()) as _i2.MapEntity);
}
