// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  late final _$emailAtom =
      Atom(name: '_LoginViewModelBase.email', context: context);

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
      Atom(name: '_LoginViewModelBase.password', context: context);

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
      Atom(name: '_LoginViewModelBase.isLoading', context: context);

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

  late final _$userIdAtom =
      Atom(name: '_LoginViewModelBase.userId', context: context);

  @override
  dynamic get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(dynamic value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$entryIdAtom =
      Atom(name: '_LoginViewModelBase.entryId', context: context);

  @override
  dynamic get entryId {
    _$entryIdAtom.reportRead();
    return super.entryId;
  }

  @override
  set entryId(dynamic value) {
    _$entryIdAtom.reportWrite(value, super.entryId, () {
      super.entryId = value;
    });
  }

  late final _$userNameAtom =
      Atom(name: '_LoginViewModelBase.userName', context: context);

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

  late final _$userListAtom =
      Atom(name: '_LoginViewModelBase.userList', context: context);

  @override
  List<UserResponse> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  bool _userListIsInitialized = false;

  @override
  set userList(List<UserResponse> value) {
    _$userListAtom
        .reportWrite(value, _userListIsInitialized ? super.userList : null, () {
      super.userList = value;
      _userListIsInitialized = true;
    });
  }

  late final _$findUserAtom =
      Atom(name: '_LoginViewModelBase.findUser', context: context);

  @override
  UserResponse get findUser {
    _$findUserAtom.reportRead();
    return super.findUser;
  }

  @override
  set findUser(UserResponse value) {
    _$findUserAtom.reportWrite(value, super.findUser, () {
      super.findUser = value;
    });
  }

  late final _$findNameAsyncAction =
      AsyncAction('_LoginViewModelBase.findName', context: context);

  @override
  Future<UserResponse?> findName(String qrUserId) {
    return _$findNameAsyncAction.run(() => super.findName(qrUserId));
  }

  late final _$loginCustomerAsyncAction =
      AsyncAction('_LoginViewModelBase.loginCustomer', context: context);

  @override
  Future<int> loginCustomer() {
    return _$loginCustomerAsyncAction.run(() => super.loginCustomer());
  }

  late final _$allUsersAsyncAction =
      AsyncAction('_LoginViewModelBase.allUsers', context: context);

  @override
  Future<List<UserResponse>> allUsers() {
    return _$allUsersAsyncAction.run(() => super.allUsers());
  }

  late final _$oneUserAsyncAction =
      AsyncAction('_LoginViewModelBase.oneUser', context: context);

  @override
  Future<Register?> oneUser(int userPath) {
    return _$oneUserAsyncAction.run(() => super.oneUser(userPath));
  }

  late final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
isLoading: ${isLoading},
userId: ${userId},
entryId: ${entryId},
userName: ${userName},
userList: ${userList},
findUser: ${findUser}
    ''';
  }
}
