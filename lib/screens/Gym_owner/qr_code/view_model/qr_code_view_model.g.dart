// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QrCodeViewModel on _QrCodeViewModelBase, Store {
  late final _$qrDataAtom =
      Atom(name: '_QrCodeViewModelBase.qrData', context: context);

  @override
  String get qrData {
    _$qrDataAtom.reportRead();
    return super.qrData;
  }

  @override
  set qrData(String value) {
    _$qrDataAtom.reportWrite(value, super.qrData, () {
      super.qrData = value;
    });
  }

  late final _$userIdAtom =
      Atom(name: '_QrCodeViewModelBase.userId', context: context);

  @override
  String get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$gymIdAtom =
      Atom(name: '_QrCodeViewModelBase.gymId', context: context);

  @override
  String get gymId {
    _$gymIdAtom.reportRead();
    return super.gymId;
  }

  @override
  set gymId(String value) {
    _$gymIdAtom.reportWrite(value, super.gymId, () {
      super.gymId = value;
    });
  }

  late final _$userNameAtom =
      Atom(name: '_QrCodeViewModelBase.userName', context: context);

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

  late final _$_getCameraPermissionAsyncAction = AsyncAction(
      '_QrCodeViewModelBase._getCameraPermission',
      context: context);

  @override
  Future<PermissionStatus> _getCameraPermission() {
    return _$_getCameraPermissionAsyncAction
        .run(() => super._getCameraPermission());
  }

  late final _$scanAsyncAction =
      AsyncAction('_QrCodeViewModelBase.scan', context: context);

  @override
  Future<dynamic> scan() {
    return _$scanAsyncAction.run(() => super.scan());
  }

  late final _$requestCameraPermissionAsyncAction = AsyncAction(
      '_QrCodeViewModelBase.requestCameraPermission',
      context: context);

  @override
  Future<void> requestCameraPermission() {
    return _$requestCameraPermissionAsyncAction
        .run(() => super.requestCameraPermission());
  }

  late final _$requestGalleryPermissionAsyncAction = AsyncAction(
      '_QrCodeViewModelBase.requestGalleryPermission',
      context: context);

  @override
  Future<void> requestGalleryPermission() {
    return _$requestGalleryPermissionAsyncAction
        .run(() => super.requestGalleryPermission());
  }

  late final _$findNameAsyncAction =
      AsyncAction('_QrCodeViewModelBase.findName', context: context);

  @override
  Future<void> findName(String qrUserId) {
    return _$findNameAsyncAction.run(() => super.findName(qrUserId));
  }

  late final _$entryGymAsyncAction =
      AsyncAction('_QrCodeViewModelBase.entryGym', context: context);

  @override
  Future<int> entryGym() {
    return _$entryGymAsyncAction.run(() => super.entryGym());
  }

  late final _$_QrCodeViewModelBaseActionController =
      ActionController(name: '_QrCodeViewModelBase', context: context);

  @override
  QRData splitData() {
    final _$actionInfo = _$_QrCodeViewModelBaseActionController.startAction(
        name: '_QrCodeViewModelBase.splitData');
    try {
      return super.splitData();
    } finally {
      _$_QrCodeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
qrData: ${qrData},
userId: ${userId},
gymId: ${gymId},
userName: ${userName}
    ''';
  }
}
