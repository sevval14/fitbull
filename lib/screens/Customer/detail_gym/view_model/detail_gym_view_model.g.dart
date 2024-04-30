// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_gym_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailGymViewModel on _DetailGymViewModel, Store {
  late final _$fetchGymAsyncAction =
      AsyncAction('_DetailGymViewModel.fetchGym', context: context);

  @override
  Future<Gym> fetchGym(int id) {
    return _$fetchGymAsyncAction.run(() => super.fetchGym(id));
  }

  late final _$fetchActivityAsyncAction =
      AsyncAction('_DetailGymViewModel.fetchActivity', context: context);

  @override
  Future<List<Activity>> fetchActivity(int id) {
    return _$fetchActivityAsyncAction.run(() => super.fetchActivity(id));
  }

  late final _$fetchEducatorAsyncAction =
      AsyncAction('_DetailGymViewModel.fetchEducator', context: context);

  @override
  Future<List<Educator>> fetchEducator(int id) {
    return _$fetchEducatorAsyncAction.run(() => super.fetchEducator(id));
  }

  late final _$fetchServiceAsyncAction =
      AsyncAction('_DetailGymViewModel.fetchService', context: context);

  @override
  Future<List<Services>> fetchService(int id) {
    return _$fetchServiceAsyncAction.run(() => super.fetchService(id));
  }

  late final _$fetchEquipmentAsyncAction =
      AsyncAction('_DetailGymViewModel.fetchEquipment', context: context);

  @override
  Future<List<Equipment>> fetchEquipment(int id) {
    return _$fetchEquipmentAsyncAction.run(() => super.fetchEquipment(id));
  }

  late final _$createQRCodeAsyncAction =
      AsyncAction('_DetailGymViewModel.createQRCode', context: context);

  @override
  Future<int> createQRCode(int userId, int gymId) {
    return _$createQRCodeAsyncAction
        .run(() => super.createQRCode(userId, gymId));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
