import 'dart:convert';
import 'package:fitbull/services/service_path.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'gym_owner_login_view_model.g.dart';
final GymOwnerLoginViewModel gymOwnerLoginViewModel = GymOwnerLoginViewModel._internal();

class GymOwnerLoginViewModel = _GymOwnerLoginViewModelBase  with _$GymOwnerLoginViewModel;

abstract class _GymOwnerLoginViewModelBase with Store {

  static final GymOwnerLoginViewModel _instance=GymOwnerLoginViewModel._internal();

  factory _GymOwnerLoginViewModelBase()=> _instance;
  _GymOwnerLoginViewModelBase._internal();


  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @observable
  var gymOwnerId;

  var gymOwnerGymId;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  Future<int> loginGymOwner() async {
    isLoading = true;
    try {
      print(email.toString() + password);
      var response = await http.post(
        Uri.parse(ServicePath.GYM_OWNER_LOGIN.path),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'

        }, body: json.encode({
        'email': email,
        'password': password,

      }),
      );
      var data = json.decode(response.body);
      gymOwnerId = data['userId'];
      gymOwnerGymId = data['gymId'];

      print(response.body);
      print(gymOwnerId);
      print(gymOwnerGymId);

      await Future.delayed(const Duration(seconds: 2));
      return response.statusCode;
    } catch (e) {
      print("Connection error: $e");
      return 0;
    }

  }
}
