import 'dart:convert';
import 'package:fitbull/screens/register/model/register_model.dart';
import 'package:fitbull/services/service_path.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'register_view_model.g.dart';

final RegisterViewModel registerViewModel = RegisterViewModel._internal();

class RegisterViewModel = _RegisterViewModelBase  with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store {
  static final RegisterViewModel _instance = RegisterViewModel._internal();

  factory _RegisterViewModelBase()=> _instance;

  _RegisterViewModelBase._internal();

  @observable
  String username = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  int userId = 0;

  @observable
  bool isLoading = false;

  @action
  void setUsername(String value) => username = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  Future<int> registerUser() async {
    isLoading = true;
    try {
      var response = await http.post(
        Uri.parse(ServicePath.CUSTOMER_REGISTER.path),
        headers: {
          'Content-Type': 'application/json',
        }, body: json.encode({
        'email': email,
        "username": username,
        'password': password,
      }),
      );
      await Future.delayed(const Duration(seconds: 2));
      return response.statusCode;
    } catch (e) {
      print("Connection error: $e");
      return 0;
    }
  }

}