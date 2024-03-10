import 'dart:convert';
import 'package:fitbull/screens/register/model/register_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModel with _$RegisterViewModel;

abstract class _RegisterViewModel with Store {
  @observable
  String username = '';

  @observable
  String email = '';

  @observable
  String password = '';

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
    var url = Uri.parse('http://10.39.11.103:8080/users');
    isLoading = true;
    Register newUser = Register(email: email,password: password,username: username);

    try {
      var backendUsername = 'user';
      var backendPassword = '557572b9-e0b1-47a9-b9ea-8b19a29f7c28';
      var backendAuth = 'Basic ' + base64Encode(utf8.encode('$backendUsername:$backendPassword'));
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': backendAuth,
        },        body: json.encode(newUser.toJson()),
      );
      await Future.delayed(const Duration(seconds: 2));

      if (response.statusCode == 200) {
        print("Register saved correctly.");
        isLoading = false;
        return response.statusCode;

      } else {
        print("Error :  ${response.statusCode}");
        response.statusCode;
      }

      return response.statusCode;
    } catch (e) {
      print("Connection error: $e");
      return 0;
    }

  }
}
