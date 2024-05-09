import 'dart:convert';
import 'package:fitbull/screens/login/viewmodel/gym_owner_login_view_model.dart';
import 'package:fitbull/services/service_path.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'create_services_view_model.g.dart';

class CreateServicesViewModel = _CreateServicesViewModel with _$CreateServicesViewModel;

abstract class _CreateServicesViewModel with Store {
  @observable
  String name = '';


  @action
  void setName(String value) => name = value;


  @action
  Future<int> createServices() async {
    try {
      var response = await http.post(
        Uri.parse(ServicePath.SERVICES.path),
        headers: {
          'Content-Type': 'application/json',
        }, body: json.encode({
        "name":name,
        "gymOwnerId":gymOwnerLoginViewModel.gymOwnerId,
        "gymId":gymOwnerLoginViewModel.gymOwnerGymId
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
