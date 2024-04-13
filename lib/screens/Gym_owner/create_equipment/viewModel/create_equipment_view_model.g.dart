// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_equipment_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateEquipmentViewModel on _CreateEquipmentViewModel, Store {
  late final _$nameAtom =
      Atom(name: '_CreateEquipmentViewModel.name', context: context);

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

  late final _$createEquipmentAsyncAction = AsyncAction(
      '_CreateEquipmentViewModel.createEquipment',
      context: context);

  @override
  Future<int> createEquipment() {
    return _$createEquipmentAsyncAction.run(() => super.createEquipment());
  }

  late final _$_CreateEquipmentViewModelActionController =
      ActionController(name: '_CreateEquipmentViewModel', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_CreateEquipmentViewModelActionController
        .startAction(name: '_CreateEquipmentViewModel.setName');
    try {
      return super.setName(value);
    } finally {
      _$_CreateEquipmentViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name}
    ''';
  }
}
