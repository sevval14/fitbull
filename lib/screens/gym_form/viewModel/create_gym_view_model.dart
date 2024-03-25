import 'dart:convert';
import 'package:fitbull/services/service_path.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'create_gym_view_model.g.dart';

class CreateGymViewModel = _CreateGymViewModel with _$CreateGymViewModel;

abstract class _CreateGymViewModel with Store {
  @observable
  String gymName = '';

  @observable
  String location = '';

  @observable
  String imagePath = '';

  @observable
  String capacity = '';

  @observable
  bool isLoading = false;

  @action
  void setGymName(String value) => gymName = value;

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
        "gymName":gymName,
        "location":location,
        "imagePath":imagePath,
        "capacity":capacity
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
