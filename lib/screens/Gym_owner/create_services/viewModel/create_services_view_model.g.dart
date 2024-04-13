// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_services_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateServicesViewModel on _CreateServicesViewModel, Store {
  late final _$nameAtom =
      Atom(name: '_CreateServicesViewModel.name', context: context);

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

  late final _$createServicesAsyncAction =
      AsyncAction('_CreateServicesViewModel.createServices', context: context);

  @override
  Future<int> createServices() {
    return _$createServicesAsyncAction.run(() => super.createServices());
  }

  late final _$_CreateServicesViewModelActionController =
      ActionController(name: '_CreateServicesViewModel', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_CreateServicesViewModelActionController.startAction(
        name: '_CreateServicesViewModel.setName');
    try {
      return super.setName(value);
    } finally {
      _$_CreateServicesViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name}
    ''';
  }
}
