// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_owner_login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GymOwnerLoginViewModel on _GymOwnerLoginViewModelBase, Store {
  late final _$emailAtom =
      Atom(name: '_GymOwnerLoginViewModelBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_GymOwnerLoginViewModelBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_GymOwnerLoginViewModelBase.isLoading', context: context);

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

  late final _$gym_owner_IdAtom =
      Atom(name: '_GymOwnerLoginViewModelBase.gym_owner_Id', context: context);

  @override
  dynamic get gym_owner_Id {
    _$gym_owner_IdAtom.reportRead();
    return super.gym_owner_Id;
  }

  @override
  set gym_owner_Id(dynamic value) {
    _$gym_owner_IdAtom.reportWrite(value, super.gym_owner_Id, () {
      super.gym_owner_Id = value;
    });
  }

  late final _$loginGymOwnerAsyncAction = AsyncAction(
      '_GymOwnerLoginViewModelBase.loginGymOwner',
      context: context);

  @override
  Future<int> loginGymOwner() {
    return _$loginGymOwnerAsyncAction.run(() => super.loginGymOwner());
  }

  late final _$_GymOwnerLoginViewModelBaseActionController =
      ActionController(name: '_GymOwnerLoginViewModelBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_GymOwnerLoginViewModelBaseActionController
        .startAction(name: '_GymOwnerLoginViewModelBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_GymOwnerLoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_GymOwnerLoginViewModelBaseActionController
        .startAction(name: '_GymOwnerLoginViewModelBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_GymOwnerLoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
isLoading: ${isLoading},
gym_owner_Id: ${gym_owner_Id}
    ''';
  }
}
