import 'dart:convert';
import 'package:fitbull/screens/login/viewmodel/login_view_model.dart';
import 'package:fitbull/services/service_path.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'create_gym_view_model.g.dart';

final CreateGymViewModel createGymViewModel = CreateGymViewModel._internal();

class CreateGymViewModel = _CreateGymViewModelBase with _$CreateGymViewModel;

abstract class _CreateGymViewModelBase with Store {

  static final CreateGymViewModel _instance=CreateGymViewModel._internal();

  factory _CreateGymViewModelBase()=> _instance;
  _CreateGymViewModelBase._internal();

  @observable
  String name = '';

  @observable
  String location = '';

  @observable
  String imagePath = '';

  @observable
  String capacity = '';

  @observable
  bool isLoading = false;

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
  Future<int> createGym() async {
    isLoading = true;
    try {
      var response = await http.post(
        Uri.parse(ServicePath.GYM.path),
        headers: {
          'Content-Type': 'application/json',
        }, body: json.encode({
        "name":name,
        "location":location,
        "imagePath":imagePath,
        "capacity":capacity,
        "userId":loginViewModel.userId
      }),
      );
      var data = json.decode(response.body);
      print(data);
      gymId=data["id"];
      print(gymId);
      await Future.delayed(const Duration(seconds: 2));
      return response.statusCode;
    } catch (e) {
      print("Connection error: $e");
      return 0;
    }

  }
}
