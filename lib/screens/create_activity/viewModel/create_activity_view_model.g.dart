// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_activity_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateActivityViewModel on _CreateActivityViewModel, Store {
  late final _$nameAtom =
      Atom(name: '_CreateActivityViewModel.name', context: context);

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

  late final _$descriptionAtom =
      Atom(name: '_CreateActivityViewModel.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$imagePathAtom =
      Atom(name: '_CreateActivityViewModel.imagePath', context: context);

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

  late final _$createActivityAsyncAction =
      AsyncAction('_CreateActivityViewModel.createActivity', context: context);

  @override
  Future<int> createActivity() {
    return _$createActivityAsyncAction.run(() => super.createActivity());
  }

  late final _$_CreateActivityViewModelActionController =
      ActionController(name: '_CreateActivityViewModel', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_CreateActivityViewModelActionController.startAction(
        name: '_CreateActivityViewModel.setName');
    try {
      return super.setName(value);
    } finally {
      _$_CreateActivityViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLocation(String value) {
    final _$actionInfo = _$_CreateActivityViewModelActionController.startAction(
        name: '_CreateActivityViewModel.setLocation');
    try {
      return super.setLocation(value);
    } finally {
      _$_CreateActivityViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImagePath(String value) {
    final _$actionInfo = _$_CreateActivityViewModelActionController.startAction(
        name: '_CreateActivityViewModel.setImagePath');
    try {
      return super.setImagePath(value);
    } finally {
      _$_CreateActivityViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
description: ${description},
imagePath: ${imagePath}
    ''';
  }
}
