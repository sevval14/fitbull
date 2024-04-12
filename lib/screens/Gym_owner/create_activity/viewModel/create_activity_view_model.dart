import 'dart:convert';
import 'package:fitbull/screens/Gym_owner/create_gym/viewModel/create_gym_view_model.dart';
import 'package:fitbull/screens/login/viewmodel/gym_owner_login_view_model.dart';
import 'package:fitbull/screens/login/viewmodel/login_view_model.dart';
import 'package:fitbull/services/service_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'create_activity_view_model.g.dart';

class CreateActivityViewModel = _CreateActivityViewModel with _$CreateActivityViewModel;

abstract class _CreateActivityViewModel with Store {
  @observable
  String name = '';

  @observable
  String description = '';

  @observable
  String imagePath = '';

  @observable
  final ImagePicker _picker = ImagePicker();

  @observable
  String targetPathImage ="";


  @action
  void setName(String value) => name = value;

  @action
  void setLocation(String value) => description = value;

  @action
  void setImagePath(String value) => imagePath = value;

  @action
  Future<int> createActivity() async {
    try {
      var response = await http.post(
        Uri.parse(ServicePath.ACTIVITES.path),
        headers: {
          'Content-Type': 'application/json',
        }, body: json.encode({
        "name":name,
        "description":description,
        "imagePath":imagePath,
        "gymOwnerId":gymOwnerLoginViewModel.gymOwnerId,
        "gymId":gymOwnerLoginViewModel.gymOwnerGymId
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

  @action
  Future<void> pickImage(TextEditingController _imagePathController) async {
    final XFile? image = await _picker.pickImage(source:  ImageSource.gallery);
    if (image != null) {
      _imagePathController.text = image.path;
    }
  }

  @action
  Future<void> uploadImage(String filePath) async {
    var request = http.MultipartRequest('POST', Uri.parse(ServicePath.IMAGE_UPLOAD.path));
    request.files.add(await http.MultipartFile.fromPath('file', filePath));

    try {
      var res = await request.send();
      if (res.statusCode == 200) {
        var target = await res.stream.bytesToString();
        targetPathImage = target.replaceAll('\\', '/');
      }
    } catch (e) {
      print("Yükleme sırasında bir hata oluştu: $e");
    }
  }


}
