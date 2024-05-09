import 'dart:convert';

import 'package:fitbull/screens/Gym_owner/create_gym/viewModel/create_gym_view_model.dart';
import 'package:fitbull/screens/Gym_owner/qr_code/view_model/qr_code_view_model.dart';
import 'package:fitbull/screens/login/viewmodel/gym_owner_login_view_model.dart';
import 'package:fitbull/screens/login/viewmodel/login_view_model.dart';
import 'package:fitbull/screens/register/viewmodel/register_view_model.dart';
import 'package:fitbull/services/service_path.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

import '../../../register/model/register_model.dart';
import '../../create_gym/model/create_gym_model.dart';
import '../model/entry_user_model.dart';
part 'total_users_view_model.g.dart';

class TotalUserViewModel = _TotalUserViewModelBase with _$TotalUserViewModel;

abstract class _TotalUserViewModelBase with Store {

  List<GymEntry> gymAllUsers=[];
  List<Register> userList = [];


  @action
  Future<void> gymAllUser() async {
    try {
      var response = await http.get(
        Uri.parse(ServicePath.ENTRY_GYM.path),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      var decodedList = jsonDecode(response.body);

      if (decodedList is List) {
        gymAllUsers = decodedList.map<GymEntry>((jsonItem) => GymEntry.fromJson(jsonItem)).toList();
        gymAllUsers = gymAllUsers.where((entry) => entry.gymId == gymOwnerLoginViewModel.gymOwnerGymId).toList();

        print("Filtrelenmiş kullanıcı sayısı: ${gymAllUsers.length}");
        for (var gymUser in gymAllUsers) {
          Register? userDetails = await loginViewModel.oneUser(gymUser.userId);
          userList.add(userDetails!);
        }
        print("Filtrelenmiş kullanıcı sayısı: ${userList.length}");

      }
    } catch (e) {
      print("Bir hata oluştu: $e");
    }
  }



}