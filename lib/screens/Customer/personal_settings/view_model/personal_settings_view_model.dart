import 'dart:convert';
import 'package:fitbull/screens/Gym_owner/qr_code/view_model/qr_code_view_model.dart';
import 'package:fitbull/screens/login/viewmodel/gym_owner_login_view_model.dart';
import 'package:fitbull/screens/login/viewmodel/login_view_model.dart';
import 'package:fitbull/screens/register/model/userResponse.dart';
import 'package:fitbull/screens/register/viewmodel/gym_owner_register_view_model.dart';
import 'package:fitbull/screens/register/viewmodel/register_view_model.dart';
import 'package:fitbull/services/service_path.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

import '../../../Customer/detail_gym/view_model/detail_gym_view_model.dart';
part 'personal_settings_view_model.g.dart';
class PersonalSettingsViewModel = _PersonalSettingsViewModelBase with _$PersonalSettingsViewModel;

abstract class _PersonalSettingsViewModelBase with Store {

  @observable
  String startWeight = "";

  @observable
  String goalWeight = '';

  @observable
  List<DateTime> selectedDays = [];

  @action
  void setStartWeight(String value) => startWeight = value;

  @action
  void setGoalWeight(String value) => goalWeight = value;

  @action
  void setSelectedDays(List<DateTime> value) => selectedDays = value;

  @action
  Future<int> updateGymEntry() async {
    try {
      var entryId = loginViewModel.findUser.entryId;
      var response = await http.put(
        Uri.parse('${ServicePath.ENTRY_GYM.path}/$entryId'),
        headers: {
          'Content-Type': 'application/json',
        },
        body : json.encode({
          "startWeight": startWeight ,
          "goalWeight": goalWeight,
          "selectedDays": selectedDays,

        }),
      );
      var data = json.decode(response.body);
      print(data);
      print("DENEME");
      await Future.delayed(const Duration(seconds: 2));
      return response.statusCode;
    } catch (e) {
      print("Connection error: $e");
      return 0;
    }

  }
}