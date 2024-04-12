// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_educator_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateEducatorViewModel on _CreateEducatorViewModel, Store {
  late final _$nameAtom =
      Atom(name: '_CreateEducatorViewModel.name', context: context);

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

  late final _$phoneNumberAtom =
      Atom(name: '_CreateEducatorViewModel.phoneNumber', context: context);

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  late final _$imagePathAtom =
      Atom(name: '_CreateEducatorViewModel.imagePath', context: context);

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

  late final _$branchAtom =
      Atom(name: '_CreateEducatorViewModel.branch', context: context);

  @override
  String get branch {
    _$branchAtom.reportRead();
    return super.branch;
  }

  @override
  set branch(String value) {
    _$branchAtom.reportWrite(value, super.branch, () {
      super.branch = value;
    });
  }

  late final _$createEducatorAsyncAction =
      AsyncAction('_CreateEducatorViewModel.createEducator', context: context);

  @override
  Future<int> createEducator() {
    return _$createEducatorAsyncAction.run(() => super.createEducator());
  }

  late final _$_CreateEducatorViewModelActionController =
      ActionController(name: '_CreateEducatorViewModel', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_CreateEducatorViewModelActionController.startAction(
        name: '_CreateEducatorViewModel.setName');
    try {
      return super.setName(value);
    } finally {
      _$_CreateEducatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhoneNumber(String value) {
    final _$actionInfo = _$_CreateEducatorViewModelActionController.startAction(
        name: '_CreateEducatorViewModel.setPhoneNumber');
    try {
      return super.setPhoneNumber(value);
    } finally {
      _$_CreateEducatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImagePath(String value) {
    final _$actionInfo = _$_CreateEducatorViewModelActionController.startAction(
        name: '_CreateEducatorViewModel.setImagePath');
    try {
      return super.setImagePath(value);
    } finally {
      _$_CreateEducatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBranch(String value) {
    final _$actionInfo = _$_CreateEducatorViewModelActionController.startAction(
        name: '_CreateEducatorViewModel.setBranch');
    try {
      return super.setBranch(value);
    } finally {
      _$_CreateEducatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
phoneNumber: ${phoneNumber},
imagePath: ${imagePath},
branch: ${branch}
    ''';
  }
}
