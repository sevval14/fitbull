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
part 'edit_user_profile_view_model.g.dart';
class EditProfileViewModel = _EditProfileViewModelBase with _$EditProfileViewModel;

abstract class _EditProfileViewModelBase with Store {

  @observable
  String userName = "";

  @observable
  String email = '';


  @action
  void setUserName(String value) => userName = value;

  @action
  void setEmail(String value) => email = value;


  @action
  Future<int> updateProfile() async {
    try {
      var userId = loginViewModel.userId;
      var response = await http.put(
        Uri.parse('${ServicePath.ALL_USERS.path}/$userId'),
        headers: {
          'Content-Type': 'application/json',
        },
        body : json.encode({
          "username": userName ,
          "email": email,
        }),
      );
      var data = json.decode(response.body);

      await Future.delayed(const Duration(seconds: 2)); // Gerekirse beklemek için
      return response.statusCode;
    } catch (e) {
      print("Connection error: $e");
      return 0;  // Bağlantı hatası durumunda 0 döndür
    }

  }
}