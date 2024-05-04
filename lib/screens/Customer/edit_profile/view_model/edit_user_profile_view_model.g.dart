// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_user_profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditProfileViewModel on _EditProfileViewModelBase, Store {
  late final _$userNameAtom =
      Atom(name: '_EditProfileViewModelBase.userName', context: context);

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_EditProfileViewModelBase.email', context: context);

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

  late final _$updateProfileAsyncAction =
      AsyncAction('_EditProfileViewModelBase.updateProfile', context: context);

  @override
  Future<int> updateProfile() {
    return _$updateProfileAsyncAction.run(() => super.updateProfile());
  }

  late final _$_EditProfileViewModelBaseActionController =
      ActionController(name: '_EditProfileViewModelBase', context: context);

  @override
  void setUserName(String value) {
    final _$actionInfo = _$_EditProfileViewModelBaseActionController
        .startAction(name: '_EditProfileViewModelBase.setUserName');
    try {
      return super.setUserName(value);
    } finally {
      _$_EditProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_EditProfileViewModelBaseActionController
        .startAction(name: '_EditProfileViewModelBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_EditProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userName: ${userName},
email: ${email}
    ''';
  }
}
