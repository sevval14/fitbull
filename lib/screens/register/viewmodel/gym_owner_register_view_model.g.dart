// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_owner_register_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GymOwnerRegisterViewModel on _GymOwnerRegisterViewModel, Store {
  late final _$usernameAtom =
      Atom(name: '_GymOwnerRegisterViewModel.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_GymOwnerRegisterViewModel.email', context: context);

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
      Atom(name: '_GymOwnerRegisterViewModel.password', context: context);

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
      Atom(name: '_GymOwnerRegisterViewModel.isLoading', context: context);

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

  late final _$gymOwnerRegisterIdAtom = Atom(
      name: '_GymOwnerRegisterViewModel.gymOwnerRegisterId', context: context);

  @override
  dynamic get gymOwnerRegisterId {
    _$gymOwnerRegisterIdAtom.reportRead();
    return super.gymOwnerRegisterId;
  }

  @override
  set gymOwnerRegisterId(dynamic value) {
    _$gymOwnerRegisterIdAtom.reportWrite(value, super.gymOwnerRegisterId, () {
      super.gymOwnerRegisterId = value;
    });
  }

  late final _$registerGymOwnerAsyncAction = AsyncAction(
      '_GymOwnerRegisterViewModel.registerGymOwner',
      context: context);

  @override
  Future<int> registerGymOwner() {
    return _$registerGymOwnerAsyncAction.run(() => super.registerGymOwner());
  }

  late final _$_GymOwnerRegisterViewModelActionController =
      ActionController(name: '_GymOwnerRegisterViewModel', context: context);

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_GymOwnerRegisterViewModelActionController
        .startAction(name: '_GymOwnerRegisterViewModel.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_GymOwnerRegisterViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_GymOwnerRegisterViewModelActionController
        .startAction(name: '_GymOwnerRegisterViewModel.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_GymOwnerRegisterViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_GymOwnerRegisterViewModelActionController
        .startAction(name: '_GymOwnerRegisterViewModel.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_GymOwnerRegisterViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
email: ${email},
password: ${password},
isLoading: ${isLoading},
gymOwnerRegisterId: ${gymOwnerRegisterId}
    ''';
  }
}
