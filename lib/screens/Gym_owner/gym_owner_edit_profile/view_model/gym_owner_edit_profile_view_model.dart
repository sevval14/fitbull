import 'dart:convert';
import 'package:fitbull/screens/login/viewmodel/gym_owner_login_view_model.dart';
import 'package:fitbull/screens/register/viewmodel/gym_owner_register_view_model.dart';
import 'package:fitbull/services/service_path.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

import '../../../Customer/detail_gym/view_model/detail_gym_view_model.dart';
part 'gym_owner_edit_profile_view_model.g.dart';

class GymOwnerEditProfileViewModel = _GymOwnerEditProfileViewModelBase with _$GymOwnerEditProfileViewModel;

abstract class _GymOwnerEditProfileViewModelBase with Store {

  @observable
  String name = "";

  @observable
  String location = '';

  @observable
  String imagePath = '';

  @observable
  String capacity = '';

  @observable
  String startHour = '';

  @observable
  String endHour = '';

  @observable
  String taxNumber = '';

  @observable
  String webSite = '';

  @observable
  var gymId;


  @action
  void setName(String value) => name = value;

  @action
  void setLocation(String value) => location = value;

  @action
  void setImagePath(String value) => imagePath = value;

  @action
  void setCapacity(String value) => capacity = value;

  @action
  void setStartHour(String value) => startHour = value;

  @action
  void setEndHour(String value) => endHour = value;

  @action
  void setTaxNumber(String value) => taxNumber = value;

  @action
  void setWebSite(String value) => webSite = value;

  @action
  Future<void> fetchCurrentGym() async {

  }

  @action
  Future<int> updateGym() async {
    try {
      var ownerId = gymOwnerRegisterViewModel.gymOwnerRegisterId ??
          gymOwnerLoginViewModel.gymOwnerId;
      var response = await http.put(
          Uri.parse('${ServicePath.GYM.path}/$ownerId'),
          headers: {
            'Content-Type': 'application/json',
          },
          body : json.encode({
            "name": name =="" ? detailGymViewModel.gym.name:name,
            "location": location ==""? detailGymViewModel.gym.location:location,
            "imagePath": imagePath ==""? detailGymViewModel.gym.imagePath:imagePath,
            "capacity": capacity ==""? detailGymViewModel.gym.capacity:capacity,
            "startHour": startHour ==""? detailGymViewModel.gym.startHour:startHour,
            "endHour": endHour ==""? detailGymViewModel.gym.endHour:endHour,
            "taxNumber": taxNumber ==""? detailGymViewModel.gym.taxNumber:taxNumber,
            "webSite": webSite ==""? detailGymViewModel.gym.webSite:webSite,
            "gymOwnerId": ownerId
          }),
      );
      var data = json.decode(response.body);
      print(data);
      int gymId = data["id"];
      print(gymId);
      await Future.delayed(const Duration(seconds: 2)); // Gerekirse beklemek için
      return response.statusCode;
    } catch (e) {
      print("Connection error: $e");
      return 0;  // Bağlantı hatası durumunda 0 döndür
    }

  }
}
