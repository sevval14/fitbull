import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

import '../../../services/service_path.dart';
part 'login_view_model.g.dart';
final LoginViewModel loginViewModel = LoginViewModel._internal();

class LoginViewModel = _LoginViewModelBase  with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {

  static final LoginViewModel _instance=LoginViewModel._internal();

  factory _LoginViewModelBase()=> _instance;
  _LoginViewModelBase._internal();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @observable
  var userId;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  Future<int> login() async {
    isLoading = true;
    try {
      print(email.toString() + password);
      print(ServicePath.LOGIN.path);
      var response = await http.post(
        Uri.parse(ServicePath.LOGIN.path),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'

        }, body: json.encode({
        'email': email,
        'password': password,
      }),
      );
      var data = json.decode(response.body);
      userId = data['userId'];
      print(response.body);
      print(userId);
      await Future.delayed(const Duration(seconds: 2));
      return response.statusCode;
    } catch (e) {
      print("Connection error: $e");
      return 0;
    }

  }
}
