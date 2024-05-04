// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_settings_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PersonalSettingsViewModel on _PersonalSettingsViewModelBase, Store {
  late final _$startWeightAtom = Atom(
      name: '_PersonalSettingsViewModelBase.startWeight', context: context);

  @override
  String get startWeight {
    _$startWeightAtom.reportRead();
    return super.startWeight;
  }

  @override
  set startWeight(String value) {
    _$startWeightAtom.reportWrite(value, super.startWeight, () {
      super.startWeight = value;
    });
  }

  late final _$goalWeightAtom =
      Atom(name: '_PersonalSettingsViewModelBase.goalWeight', context: context);

  @override
  String get goalWeight {
    _$goalWeightAtom.reportRead();
    return super.goalWeight;
  }

  @override
  set goalWeight(String value) {
    _$goalWeightAtom.reportWrite(value, super.goalWeight, () {
      super.goalWeight = value;
    });
  }

  late final _$selectedDaysAtom = Atom(
      name: '_PersonalSettingsViewModelBase.selectedDays', context: context);

  @override
  List<DateTime> get selectedDays {
    _$selectedDaysAtom.reportRead();
    return super.selectedDays;
  }

  @override
  set selectedDays(List<DateTime> value) {
    _$selectedDaysAtom.reportWrite(value, super.selectedDays, () {
      super.selectedDays = value;
    });
  }

  late final _$updateGymEntryAsyncAction = AsyncAction(
      '_PersonalSettingsViewModelBase.updateGymEntry',
      context: context);

  @override
  Future<int> updateGymEntry() {
    return _$updateGymEntryAsyncAction.run(() => super.updateGymEntry());
  }

  late final _$_PersonalSettingsViewModelBaseActionController =
      ActionController(
          name: '_PersonalSettingsViewModelBase', context: context);

  @override
  void setStartWeight(String value) {
    final _$actionInfo = _$_PersonalSettingsViewModelBaseActionController
        .startAction(name: '_PersonalSettingsViewModelBase.setStartWeight');
    try {
      return super.setStartWeight(value);
    } finally {
      _$_PersonalSettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGoalWeight(String value) {
    final _$actionInfo = _$_PersonalSettingsViewModelBaseActionController
        .startAction(name: '_PersonalSettingsViewModelBase.setGoalWeight');
    try {
      return super.setGoalWeight(value);
    } finally {
      _$_PersonalSettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedDays(List<DateTime> value) {
    final _$actionInfo = _$_PersonalSettingsViewModelBaseActionController
        .startAction(name: '_PersonalSettingsViewModelBase.setSelectedDays');
    try {
      return super.setSelectedDays(value);
    } finally {
      _$_PersonalSettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
startWeight: ${startWeight},
goalWeight: ${goalWeight},
selectedDays: ${selectedDays}
    ''';
  }
}
