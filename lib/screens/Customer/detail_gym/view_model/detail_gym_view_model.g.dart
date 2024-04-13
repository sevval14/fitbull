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

  @override
  String toString() {
    return '''

    ''';
  }
}
