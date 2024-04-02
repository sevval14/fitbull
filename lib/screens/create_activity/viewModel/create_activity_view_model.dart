import 'dart:convert';
import 'package:fitbull/screens/create_gym/viewModel/create_gym_view_model.dart';
import 'package:fitbull/screens/login/viewmodel/login_view_model.dart';
import 'package:fitbull/services/service_path.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'create_activity_view_model.g.dart';

class CreateActivityViewModel = _CreateActivityViewModel with _$CreateActivityViewModel;

abstract class _CreateActivityViewModel with Store {
  @observable
  String name = '';

  @observable
  String description = '';

  @observable
  String imagePath = '';


  @action
  void setName(String value) => name = value;

  @action
  void setLocation(String value) => description = value;

  @action
  void setImagePath(String value) => imagePath = value;

  @action
  Future<int> createActivity() async {
    try {
      var response = await http.post(
        Uri.parse(ServicePath.ACTIVITES.path),
        headers: {
          'Content-Type': 'application/json',
        }, body: json.encode({
        "name":name,
        "description":description,
        "imagePath":imagePath,
        "userId":loginViewModel.userId,
        "gymId":createGymViewModel.gymId
      }),
      );
      print(loginViewModel.userId);
      print(createGymViewModel.gymId);

      await Future.delayed(const Duration(seconds: 2));
      return response.statusCode;
    } catch (e) {
      print("Connection error: $e");
      return 0;
    }

  }
}
