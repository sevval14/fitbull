import 'dart:convert';
import 'package:fitbull/screens/Gym_owner/create_gym/viewModel/create_gym_view_model.dart';
import 'package:fitbull/screens/login/viewmodel/gym_owner_login_view_model.dart';
import 'package:fitbull/screens/login/viewmodel/login_view_model.dart';
import 'package:fitbull/services/service_path.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'create_educator_view_model.g.dart';

class CreateEducatorViewModel = _CreateEducatorViewModel with _$CreateEducatorViewModel;

abstract class _CreateEducatorViewModel with Store {
  @observable
  String name = '';

  @observable
  String phoneNumber = '';

  @observable
  String imagePath = '';


  @action
  void setName(String value) => name = value;

  @action
  void setPhoneNumber(String value) => phoneNumber = value;

  @action
  void setImagePath(String value) => imagePath = value;

  @action
  Future<int> createEducator() async {
    try {
      var response = await http.post(
        Uri.parse(ServicePath.EDUCATOR.path),
        headers: {
          'Content-Type': 'application/json',
        }, body: json.encode({
        "name":name,
        "phoneNumber":phoneNumber,
        "imagePath":imagePath,
        "gymOwnerId":gymOwnerLoginViewModel.gymOwnerId,
        "gymId":gymOwnerLoginViewModel.gymOwnerGymId
      }),
      );
      print(response.body);

      await Future.delayed(const Duration(seconds: 2));
      return response.statusCode;
    } catch (e) {
      print("Connection error: $e");
      return 0;
    }

  }
}
