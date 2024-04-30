import 'dart:convert';
import 'package:fitbull/screens/register/model/register_model.dart';
import 'package:fitbull/services/service_path.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'register_view_model.g.dart';

final RegisterViewModel registerViewModel = RegisterViewModel._internal();

class RegisterViewModel = _RegisterViewModelBase  with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store {
  static final RegisterViewModel _instance=RegisterViewModel._internal();

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
  late List<Register> userList= [];


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
        "username":username,
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

  @action
  Future<List<Register>> allUsers() async{
    try{
      var response = await http.get(
        Uri.parse(ServicePath.ALL_USERS.path),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      var decodedList = jsonDecode(response.body);
      if (decodedList is List) {
        userList = decodedList.map<Register>((jsonItem) => Register.fromJson(jsonItem)).toList();
        print("selam");
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
      print("${ServicePath.ALL_USERS.path}/$userPath");  // Debug amaçlı URI'yi yazdır

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
