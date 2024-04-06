// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_gym_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateGymViewModel on _CreateGymViewModelBase, Store {
  late final _$nameAtom =
      Atom(name: '_CreateGymViewModelBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$locationAtom =
      Atom(name: '_CreateGymViewModelBase.location', context: context);

  @override
  String get location {
    _$locationAtom.reportRead();
    return super.location;
  }

  @override
  set location(String value) {
    _$locationAtom.reportWrite(value, super.location, () {
      super.location = value;
    });
  }

  late final _$imagePathAtom =
      Atom(name: '_CreateGymViewModelBase.imagePath', context: context);

  @override
  String get imagePath {
    _$imagePathAtom.reportRead();
    return super.imagePath;
  }

  @override
  set imagePath(String value) {
    _$imagePathAtom.reportWrite(value, super.imagePath, () {
      super.imagePath = value;
    });
  }

  late final _$capacityAtom =
      Atom(name: '_CreateGymViewModelBase.capacity', context: context);

  @override
  String get capacity {
    _$capacityAtom.reportRead();
    return super.capacity;
  }

  @override
  set capacity(String value) {
    _$capacityAtom.reportWrite(value, super.capacity, () {
      super.capacity = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CreateGymViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$gymIdAtom =
      Atom(name: '_CreateGymViewModelBase.gymId', context: context);

  @override
  dynamic get gymId {
    _$gymIdAtom.reportRead();
    return super.gymId;
  }

  @override
  set gymId(dynamic value) {
    _$gymIdAtom.reportWrite(value, super.gymId, () {
      super.gymId = value;
    });
  }

  late final _$createGymAsyncAction =
      AsyncAction('_CreateGymViewModelBase.createGym', context: context);

  @override
  Future<int> createGym() {
    return _$createGymAsyncAction.run(() => super.createGym());
  }

  late final _$_CreateGymViewModelBaseActionController =
      ActionController(name: '_CreateGymViewModelBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_CreateGymViewModelBaseActionController.startAction(
        name: '_CreateGymViewModelBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_CreateGymViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLocation(String value) {
    final _$actionInfo = _$_CreateGymViewModelBaseActionController.startAction(
        name: '_CreateGymViewModelBase.setLocation');
    try {
      return super.setLocation(value);
    } finally {
      _$_CreateGymViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImagePath(String value) {
    final _$actionInfo = _$_CreateGymViewModelBaseActionController.startAction(
        name: '_CreateGymViewModelBase.setImagePath');
    try {
      return super.setImagePath(value);
    } finally {
      _$_CreateGymViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCapacity(String value) {
    final _$actionInfo = _$_CreateGymViewModelBaseActionController.startAction(
        name: '_CreateGymViewModelBase.setCapacity');
    try {
      return super.setCapacity(value);
    } finally {
      _$_CreateGymViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
location: ${location},
imagePath: ${imagePath},
capacity: ${capacity},
isLoading: ${isLoading},
gymId: ${gymId}
    ''';
  }
}
