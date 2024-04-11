import 'dart:convert';
import 'package:fitbull/screens/Gym_owner/create_activity/model/create_activity_model.dart';
import 'package:fitbull/screens/Gym_owner/create_educator/model/create_educator_model.dart';
import 'package:fitbull/screens/Gym_owner/create_gym/model/create_gym_model.dart';
import 'package:fitbull/screens/login/viewmodel/gym_owner_login_view_model.dart';
import 'package:fitbull/services/service_path.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'gym_owner_dashboard_view_model.g.dart';

class GymOwnerDashboardViewModel = _GymOwnerDashboardViewModel with _$GymOwnerDashboardViewModel;

abstract class _GymOwnerDashboardViewModel with Store {
  late List<Activity> activityList= [];
  late List<Educator> educatorList= [];

  @action
  Future<List<Activity>> fetchActivity()async{
    final response = await http
        .get(Uri.parse(ServicePath.ACTIVITES.path));
    if (response.statusCode == 200) {
      var decodedList = jsonDecode(response.body);
      if (decodedList is List) {
        activityList = decodedList.map<Activity>((jsonItem) => Activity.fromJson(jsonItem)).toList();
        print(activityList);
      } else {
      }
      return activityList;
    } else {
      throw Exception('Failed to load gym');
    }
  }

  @action
  Future<List<Educator>> fetchEducator() async {
    final response = await http.get(Uri.parse(ServicePath.EDUCATOR.path));
    var data =json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      var decodedList = jsonDecode(response.body);
      if (decodedList is List) {
        educatorList = decodedList
            .map<Educator>((jsonItem) => Educator.fromJson(jsonItem))
            .where((educator) => educator.gymId == gymOwnerLoginViewModel.gymOwnerGymId)
            .toList();
        print(educatorList);
        return educatorList;
      } else {
        // Handle the case where decodedList is not a List
        throw Exception('Data format is not a list');
      }
    } else {
      throw Exception('Failed to load gym');
    }
  }}