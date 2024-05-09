import 'dart:convert';
import 'package:fitbull/screens/Gym_owner/create_gym/model/create_gym_model.dart';
import 'package:fitbull/services/service_path.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'dashboard_view_model.g.dart';

class DashboardViewModel = _DashboardViewModel with _$DashboardViewModel;

abstract class _DashboardViewModel with Store {
  late List<Gym> gymList= [];

  @action
  Future<List<Gym>> fetchGym()async{
    final response = await http
        .get(Uri.parse(ServicePath.GYM.path));
    if (response.statusCode == 200) {
      var decodedList = jsonDecode(response.body);
      if (decodedList is List) {
         gymList = decodedList.map<Gym>((jsonItem) => Gym.fromJson(jsonItem)).toList();
      } else {
      }
      return gymList;
    } else {
      throw Exception('Failed to load gym');
    }
  }

}
