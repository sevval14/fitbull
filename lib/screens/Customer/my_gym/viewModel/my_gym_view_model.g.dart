// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_gym_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyGymViewModel on _MyGymViewModel, Store {
  late final _$gymEntryIdAtom =
      Atom(name: '_MyGymViewModel.gymEntryId', context: context);

  @override
  int get gymEntryId {
    _$gymEntryIdAtom.reportRead();
    return super.gymEntryId;
  }

  @override
  set gymEntryId(int value) {
    _$gymEntryIdAtom.reportWrite(value, super.gymEntryId, () {
      super.gymEntryId = value;
    });
  }

  late final _$startWeightAtom =
      Atom(name: '_MyGymViewModel.startWeight', context: context);

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
      Atom(name: '_MyGymViewModel.goalWeight', context: context);

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

  late final _$addDateAtom =
      Atom(name: '_MyGymViewModel.addDate', context: context);

  @override
  bool get addDate {
    _$addDateAtom.reportRead();
    return super.addDate;
  }

  @override
  set addDate(bool value) {
    _$addDateAtom.reportWrite(value, super.addDate, () {
      super.addDate = value;
    });
  }

  late final _$copySelectedAtom =
      Atom(name: '_MyGymViewModel.copySelected', context: context);

  @override
  ObservableList<String> get copySelected {
    _$copySelectedAtom.reportRead();
    return super.copySelected;
  }

  @override
  set copySelected(ObservableList<String> value) {
    _$copySelectedAtom.reportWrite(value, super.copySelected, () {
      super.copySelected = value;
    });
  }

  late final _$gymEntryAtom =
      Atom(name: '_MyGymViewModel.gymEntry', context: context);

  @override
  GymEntry get gymEntry {
    _$gymEntryAtom.reportRead();
    return super.gymEntry;
  }

  @override
  set gymEntry(GymEntry value) {
    _$gymEntryAtom.reportWrite(value, super.gymEntry, () {
      super.gymEntry = value;
    });
  }

  late final _$getOneGymEntryAsyncAction =
      AsyncAction('_MyGymViewModel.getOneGymEntry', context: context);

  @override
  Future<void> getOneGymEntry(int userId) {
    return _$getOneGymEntryAsyncAction.run(() => super.getOneGymEntry(userId));
  }

  late final _$_MyGymViewModelActionController =
      ActionController(name: '_MyGymViewModel', context: context);

  @override
  void setStartWeight(String value) {
    final _$actionInfo = _$_MyGymViewModelActionController.startAction(
        name: '_MyGymViewModel.setStartWeight');
    try {
      return super.setStartWeight(value);
    } finally {
      _$_MyGymViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGoalWeight(String value) {
    final _$actionInfo = _$_MyGymViewModelActionController.startAction(
        name: '_MyGymViewModel.setGoalWeight');
    try {
      return super.setGoalWeight(value);
    } finally {
      _$_MyGymViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gymEntryId: ${gymEntryId},
startWeight: ${startWeight},
goalWeight: ${goalWeight},
addDate: ${addDate},
copySelected: ${copySelected},
gymEntry: ${gymEntry}
    ''';
  }
}
