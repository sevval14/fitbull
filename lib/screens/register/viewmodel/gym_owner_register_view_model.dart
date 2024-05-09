import 'dart:convert';
import 'package:fitbull/screens/register/model/register_model.dart';
import 'package:fitbull/services/service_path.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'gym_owner_register_view_model.g.dart';

final GymOwnerRegisterViewModel gymOwnerRegisterViewModel = GymOwnerRegisterViewModel._internal();

class GymOwnerRegisterViewModel = _GymOwnerRegisterViewModel with _$GymOwnerRegisterViewModel;

abstract class _GymOwnerRegisterViewModel with Store {

  static final GymOwnerRegisterViewModel _instance=GymOwnerRegisterViewModel._internal();

  factory _GymOwnerRegisterViewModel()=> _instance;
  _GymOwnerRegisterViewModel._internal();

  @observable
  String username = '';

  @observable
  String email = '';

  @observable
  String password = '';


  @observable
  bool isLoading = false;

  @observable
  var gymOwnerRegisterId;

  @action
  void setUsername(String value) => username = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  Future<int> registerGymOwner() async {
    isLoading = true;
    try {
      var response = await http.post(
        Uri.parse(ServicePath.GYM_OWNER_REGISTER.path),
        headers: {
          'Content-Type': 'application/json',
        }, body: json.encode({
        'email': email,
        "username":username,
        'password': password,
      }),
      );
      await Future.delayed(const Duration(seconds: 2));
      var data = json.decode(response.body);
      gymOwnerRegisterId = data['userId'];
      return response.statusCode;
    } catch (e) {
      print("Connection error: $e");
      return 0;
    }

  }
}