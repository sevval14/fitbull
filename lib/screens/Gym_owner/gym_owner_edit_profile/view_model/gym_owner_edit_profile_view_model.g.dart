// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_owner_edit_profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GymOwnerEditProfileViewModel
    on _GymOwnerEditProfileViewModelBase, Store {
  late final _$nameAtom =
      Atom(name: '_GymOwnerEditProfileViewModelBase.name', context: context);

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

  late final _$locationAtom = Atom(
      name: '_GymOwnerEditProfileViewModelBase.location', context: context);

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

  late final _$imagePathAtom = Atom(
      name: '_GymOwnerEditProfileViewModelBase.imagePath', context: context);

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

  late final _$capacityAtom = Atom(
      name: '_GymOwnerEditProfileViewModelBase.capacity', context: context);

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

  late final _$startHourAtom = Atom(
      name: '_GymOwnerEditProfileViewModelBase.startHour', context: context);

  @override
  String get startHour {
    _$startHourAtom.reportRead();
    return super.startHour;
  }

  @override
  set startHour(String value) {
    _$startHourAtom.reportWrite(value, super.startHour, () {
      super.startHour = value;
    });
  }

  late final _$endHourAtom =
      Atom(name: '_GymOwnerEditProfileViewModelBase.endHour', context: context);

  @override
  String get endHour {
    _$endHourAtom.reportRead();
    return super.endHour;
  }

  @override
  set endHour(String value) {
    _$endHourAtom.reportWrite(value, super.endHour, () {
      super.endHour = value;
    });
  }

  late final _$taxNumberAtom = Atom(
      name: '_GymOwnerEditProfileViewModelBase.taxNumber', context: context);

  @override
  String get taxNumber {
    _$taxNumberAtom.reportRead();
    return super.taxNumber;
  }

  @override
  set taxNumber(String value) {
    _$taxNumberAtom.reportWrite(value, super.taxNumber, () {
      super.taxNumber = value;
    });
  }

  late final _$webSiteAtom =
      Atom(name: '_GymOwnerEditProfileViewModelBase.webSite', context: context);

  @override
  String get webSite {
    _$webSiteAtom.reportRead();
    return super.webSite;
  }

  @override
  set webSite(String value) {
    _$webSiteAtom.reportWrite(value, super.webSite, () {
      super.webSite = value;
    });
  }

  late final _$gymIdAtom =
      Atom(name: '_GymOwnerEditProfileViewModelBase.gymId', context: context);

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

  late final _$updateGymAsyncAction = AsyncAction(
      '_GymOwnerEditProfileViewModelBase.updateGym',
      context: context);

  @override
  Future<int> updateGym() {
    return _$updateGymAsyncAction.run(() => super.updateGym());
  }

  late final _$_GymOwnerEditProfileViewModelBaseActionController =
      ActionController(
          name: '_GymOwnerEditProfileViewModelBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_GymOwnerEditProfileViewModelBaseActionController
        .startAction(name: '_GymOwnerEditProfileViewModelBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_GymOwnerEditProfileViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setLocation(String value) {
    final _$actionInfo = _$_GymOwnerEditProfileViewModelBaseActionController
        .startAction(name: '_GymOwnerEditProfileViewModelBase.setLocation');
    try {
      return super.setLocation(value);
    } finally {
      _$_GymOwnerEditProfileViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setImagePath(String value) {
    final _$actionInfo = _$_GymOwnerEditProfileViewModelBaseActionController
        .startAction(name: '_GymOwnerEditProfileViewModelBase.setImagePath');
    try {
      return super.setImagePath(value);
    } finally {
      _$_GymOwnerEditProfileViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCapacity(String value) {
    final _$actionInfo = _$_GymOwnerEditProfileViewModelBaseActionController
        .startAction(name: '_GymOwnerEditProfileViewModelBase.setCapacity');
    try {
      return super.setCapacity(value);
    } finally {
      _$_GymOwnerEditProfileViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setStartHour(String value) {
    final _$actionInfo = _$_GymOwnerEditProfileViewModelBaseActionController
        .startAction(name: '_GymOwnerEditProfileViewModelBase.setStartHour');
    try {
      return super.setStartHour(value);
    } finally {
      _$_GymOwnerEditProfileViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setEndHour(String value) {
    final _$actionInfo = _$_GymOwnerEditProfileViewModelBaseActionController
        .startAction(name: '_GymOwnerEditProfileViewModelBase.setEndHour');
    try {
      return super.setEndHour(value);
    } finally {
      _$_GymOwnerEditProfileViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTaxNumber(String value) {
    final _$actionInfo = _$_GymOwnerEditProfileViewModelBaseActionController
        .startAction(name: '_GymOwnerEditProfileViewModelBase.setTaxNumber');
    try {
      return super.setTaxNumber(value);
    } finally {
      _$_GymOwnerEditProfileViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setWebSite(String value) {
    final _$actionInfo = _$_GymOwnerEditProfileViewModelBaseActionController
        .startAction(name: '_GymOwnerEditProfileViewModelBase.setWebSite');
    try {
      return super.setWebSite(value);
    } finally {
      _$_GymOwnerEditProfileViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
location: ${location},
imagePath: ${imagePath},
capacity: ${capacity},
startHour: ${startHour},
endHour: ${endHour},
taxNumber: ${taxNumber},
webSite: ${webSite},
gymId: ${gymId}
    ''';
  }
}
