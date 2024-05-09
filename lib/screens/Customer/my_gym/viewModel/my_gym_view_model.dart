import 'dart:convert';

import 'package:fitbull/screens/Customer/my_gym/model/my_gym_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

import '../../../../services/service_path.dart';
part 'my_gym_view_model.g.dart';

final MyGymViewModel myGymViewModel = MyGymViewModel._internal();

class MyGymViewModel = _MyGymViewModel with _$MyGymViewModel;

abstract class _MyGymViewModel with Store {
  static final MyGymViewModel _instance=MyGymViewModel._internal();

  factory _MyGymViewModel()=> _instance;
  _MyGymViewModel._internal();

  @observable
  int gymEntryId=0;

  @observable
  String startWeight ="";

  @observable
  String goalWeight ="";

  @observable
  ObservableList<DateTime> copySelected =ObservableList<DateTime>();

  @observable
  GymEntry gymEntry = GymEntry(id: 0, userId: 0, gymId: 0, entryTime: DateTime.now(), startWeight: "startWeight", goalWeight: "goalWeight", selectedDays: [], gymName: "gymName", gymLocation: "gymLocation", startHour: "startHour", endHour: "endHour");

  @action
  void setStartWeight(String value) => startWeight = value;

  @action
  void setGoalWeight(String value) => goalWeight = value;


  @action
  void addDays(DateTime time){
    var  convert = DateTime.parse(time.toString()).toUtc();
    copySelected.add(convert);

  }

  Future<int> updateEntryGym(int gymEntryId) async{
    try{
      print(copySelected);
      var localDates = copySelected.map((date) =>
      date.toIso8601String()).toList();
      print(localDates);
      var response = await http.put(Uri.parse('${ServicePath.ENTRY_GYM.path}/$gymEntryId'),
            headers: {
      'Content-Type': 'application/json',
      },
      body : json.encode({
      "startWeight":startWeight ==""?gymEntry.startWeight:startWeight ,
      "goalWeight":goalWeight==""?gymEntry.goalWeight:goalWeight,
      "selectedDays":localDates,
      }),
      );
      var data = json.decode(response.body);
      print(data);
      int gymEntryIdControl = data["id"];
      print(gymEntryIdControl);
      await Future.delayed(const Duration(seconds: 2));
      return response.statusCode;
    }catch(e){
      print("Failed $e");
    }
    return 0;

  }

  @action
  Future<void> getOneGymEntry(int userId) async {
    try {
      var response = await http.get(
        Uri.parse('${ServicePath.ENTRY_GYM.path}/$userId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(response.body);
      var data = json.decode(response.body);
      gymEntry=GymEntry.fromJson(data);
      for(var value in myGymViewModel.gymEntry.selectedDays){
        var convert = DateTime.parse(value).toUtc();
        if(copySelected.contains(convert)==false){
          copySelected.add(convert);
        }
      }
      print(gymEntry);
    } catch (e) {
      print("Bir hata oluştu: $e");
    }
  }


}

