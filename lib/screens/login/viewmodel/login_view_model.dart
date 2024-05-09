import 'dart:convert';

import 'package:fitbull/screens/register/model/userResponse.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

import '../../../services/service_path.dart';
import '../../Gym_owner/qr_code/view_model/qr_code_view_model.dart';
import '../../register/model/register_model.dart';
import '../../register/viewmodel/register_view_model.dart';
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

  @observable
  var entryId;

  @observable
  String userName="";

  @observable
  late List<UserResponse> userList= [];

  @observable
  UserResponse findUser =UserResponse(id: 0, userName: "", email: "", entryId: 0);

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  Future<UserResponse?> findName(String qrUserId) async {
    await allUsers();
    for (var user in userList) {
      if (user.id.toString() == qrUserId) {
        userName = user.userName;
        findUser=user;
        return user;
      }
    }
    return null;
  }

  @action
  Future<int> loginCustomer() async {
    isLoading = true;
    try {
      var response = await http.post(
        Uri.parse(ServicePath.CUSTOMER_LOGIN.path),
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
      entryId = data['entryId'];

      findUser= (await findName(userId.toString()))!;

      await Future.delayed(const Duration(seconds: 2));
      return response.statusCode;
    } catch (e) {
      print("Connection error: $e");
      return 0;
    }

  }

  @action
  Future<List<UserResponse>> allUsers() async{
    try{
      var response = await http.get(
        Uri.parse(ServicePath.ALL_USERS.path),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      var decodedList = jsonDecode(response.body);
      if (decodedList is List) {
        userList = decodedList.map<UserResponse>((jsonItem) => UserResponse.fromJson(jsonItem)).toList();
      }
      return userList;
    }catch(e){
      print("Connection error: $e");
      return [];
    }
  }

  @action
  Future<Register?> oneUser(int userPath) async {
    try {
      var response = await http.get(
        Uri.parse("${ServicePath.ALL_USERS.path}/$userPath"),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return Register.fromJson(jsonDecode(response.body));
      } else {
        print('Failed to load user with status code: ${response.statusCode}');
        throw Exception('Failed to load user');
      }
    } catch (e) {
      print("Connection error: $e");
      throw Exception('Connection error: $e'); // Hata fırlatılarak üst katmana bildirilir
    }
  }
}