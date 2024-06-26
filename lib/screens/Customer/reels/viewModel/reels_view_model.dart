import 'dart:convert';
import 'package:fitbull/services/service_path.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

import '../../../Gym_owner/create_activity/model/create_activity_model.dart';
part 'reels_view_model.g.dart';

class ReelsViewModel = _ReelsViewModel with _$ReelsViewModel;

abstract class _ReelsViewModel with Store {
  late List<Activity> activityList= [];

  @action
  Future<List<Activity>> fetchActivity()async{
    final response = await http
        .get(Uri.parse(ServicePath.ACTIVITES.path));
    if (response.statusCode == 200) {
      var decodedList = jsonDecode(response.body);
      if (decodedList is List) {
        activityList = decodedList.map<Activity>((jsonItem) => Activity.fromJson(jsonItem)).toList();
      } else {
      }
      return activityList;
    } else {
      throw Exception('Failed to load activity');
    }
  }

}
