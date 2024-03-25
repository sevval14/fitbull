import 'dart:convert';
import 'package:fitbull/services/service_path.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'create_gym_view_model.g.dart';

class CreateGymViewModel = _CreateGymViewModel with _$CreateGymViewModel;

abstract class _CreateGymViewModel with Store {
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
        "capacity":capacity
      }),
      );
      print(response.body);
      await Future.delayed(const Duration(seconds: 2));
      return response.statusCode;
    } catch (e) {
      print("Connection error: $e");
      return 0;
    }

  }
}
