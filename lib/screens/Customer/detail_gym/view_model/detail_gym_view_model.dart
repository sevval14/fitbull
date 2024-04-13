import 'dart:convert';
import 'package:fitbull/screens/Gym_owner/create_equipment/model/create_equipment_model.dart';
import 'package:fitbull/screens/Gym_owner/create_gym/model/create_gym_model.dart';
import 'package:fitbull/screens/Gym_owner/create_services/model/create_services_model.dart';
import 'package:fitbull/services/service_path.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

import '../../../Gym_owner/create_activity/model/create_activity_model.dart';
import '../../../Gym_owner/create_educator/model/create_educator_model.dart';
part 'detail_gym_view_model.g.dart';

final DetailGymViewModel detailGymViewModel = DetailGymViewModel._internal();

class DetailGymViewModel = _DetailGymViewModel with _$DetailGymViewModel;

abstract class _DetailGymViewModel with Store {
  static final DetailGymViewModel _instance=DetailGymViewModel._internal();

  factory _DetailGymViewModel()=> _instance;
  _DetailGymViewModel._internal();

  late Gym gym ;
  late List<Activity> activityList= [];
  late List<Educator> educatorList= [];
  late List<Services> serviceList= [];
  late List<Equipment> equipmentList= [];



  @action
  Future<Gym> fetchGym(int id) async {
    final response = await http.get(Uri.parse(ServicePath.GYM.path));

    if (response.statusCode == 200) {
      var decodedList = json.decode(response.body);
      if (decodedList is List) {
        gym = decodedList
            .map<Gym>((jsonItem) => Gym.fromJson(jsonItem))
            .firstWhere((gym) => gym.id == id, orElse: () => throw Exception('Gym not found'));
        print(gym);
        print(gym.capacity);
        return gym;
      } else {
        throw Exception('Data format is not a list');
      }
    } else {
      throw Exception('Failed to load gym');
    }
  }


  @action
  Future<List<Activity>> fetchActivity(int id)async{
    final response = await http
        .get(Uri.parse(ServicePath.ACTIVITES.path));
    if (response.statusCode == 200) {
      var decodedList = jsonDecode(response.body);
      if (decodedList is List) {
        activityList = decodedList
            .map<Activity>((jsonItem) => Activity.fromJson(jsonItem))
            .where((activity) => activity.gymId == id)
            .toList();
        print(activityList);
      } else {
      }
      return activityList;
    } else {
      throw Exception('Failed to load gym');
    }
  }

  @action
  Future<List<Educator>> fetchEducator(int id) async {
    final response = await http.get(Uri.parse(ServicePath.EDUCATOR.path));
    var data =json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      var decodedList = jsonDecode(response.body);
      if (decodedList is List) {
        educatorList = decodedList
            .map<Educator>((jsonItem) => Educator.fromJson(jsonItem))
            .where((educator) => educator.gymId == id)
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
  }

  @action
  Future<List<Services>> fetchService(int id) async {
    final response = await http.get(Uri.parse(ServicePath.SERVICES.path));
    var data =json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      var decodedList = jsonDecode(response.body);
      if (decodedList is List) {
        serviceList = decodedList
            .map<Services>((jsonItem) => Services.fromJson(jsonItem))
            .where((services) => services.gymId == id)
            .toList();
        print(serviceList);
        return serviceList;
      } else {
        // Handle the case where decodedList is not a List
        throw Exception('Data format is not a list');
      }
    } else {
      throw Exception('Failed to load gym');
    }
  }

  @action
  Future<List<Equipment>> fetchEquipment(int id) async {
    final response = await http.get(Uri.parse(ServicePath.EQUIPMENT.path));
    var data =json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      var decodedList = jsonDecode(response.body);
      if (decodedList is List) {
        equipmentList = decodedList
            .map<Equipment>((jsonItem) => Equipment.fromJson(jsonItem))
            .where((equipment) => equipment.gymId == id)
            .toList();
        print(equipmentList);
        return equipmentList;
      } else {
        // Handle the case where decodedList is not a List
        throw Exception('Data format is not a list');
      }
    } else {
      throw Exception('Failed to load gym');
    }
  }

}
