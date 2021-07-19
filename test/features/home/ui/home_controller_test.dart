import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_web/core/adapters/map/map_entity.dart';
import 'package:t_truck_web/core/components/menu/menu_model.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/core/utils/app_dialog.dart';
import 'package:t_truck_web/features/home/domain/use_cases/map_use_case.dart';
import 'package:t_truck_web/features/home/ui/home_controller.dart';

import 'home_controller_test.mocks.dart';

@GenerateMocks([MapUseCase, AppDialog])
void main() {
  late HomeController controller;
  MapUseCase mockMapUseCase;
  AppDialog mockAppDialog;
  setUp(() {
    mockMapUseCase = MockMapUseCase();
    mockAppDialog = MockAppDialog();
    controller = HomeController(
      mapUseCase: mockMapUseCase,
      appDialog: mockAppDialog,
    );
  });

  test('should create map with no erros', () {
    when(controller.mapUseCase(const Params())).thenAnswer(
      (realInvocation) => Right(
        MapEntity(
          map: Container(),
        ),
      ),
    );
    controller.createMap();
    expect(controller.mapEntity.value.map, isA<Container>());
  });

  test('should return error', () {
    when(controller.mapUseCase(const Params())).thenAnswer(
      (realInvocation) => const Left(
        AppFailure(),
      ),
    );
    controller.createMap();
    verify(
      controller.appDialog.error(
        menssagem: anyNamed('menssagem'),
      ),
    ).called(1);
  });

  test('should verify quantity after much elemnts', () {
    controller.addQuickAcces(MenuModel(text: 'a', route: '/a'));
    controller.addQuickAcces(MenuModel(text: 's', route: '/s'));
    controller.addQuickAcces(MenuModel(text: 'd', route: '/d'));
    controller.addQuickAcces(MenuModel(text: 'f', route: '/f'));
    controller.addQuickAcces(MenuModel(text: 'g', route: '/g'));
    controller.addQuickAcces(MenuModel(text: 'w', route: '/w'));
    controller.addQuickAcces(MenuModel(text: 'e', route: '/e'));
    expect(controller.quickAccess().length, 4);
    expect(controller.quickAccess().last.text, 'f');
    expect(controller.quickAccess().first.text, 'e');
  });
}
