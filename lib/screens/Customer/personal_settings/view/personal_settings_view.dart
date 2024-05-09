import 'package:fitbull/screens/Customer/edit_profile/view_model/edit_user_profile_view_model.dart';
import 'package:fitbull/screens/Customer/my_gym/viewModel/my_gym_view_model.dart';
import 'package:fitbull/screens/Customer/profile/view/profile_view.dart';
import 'package:fitbull/screens/login/viewmodel/login_view_model.dart';
import 'package:fitbull/screens/register/model/userResponse.dart';
import 'package:flutter/material.dart';

import '../../../Gym_owner/qr_code/view_model/qr_code_view_model.dart';

class PersonalSettings extends StatefulWidget {
  @override
  _PersonalSettingsState createState() => _PersonalSettingsState();
}

class _PersonalSettingsState extends State<PersonalSettings> {
  final TextEditingController _startWeightController = TextEditingController();
  final TextEditingController _goalWeightController = TextEditingController();
  final EditProfileViewModel editProfileViewModel =  EditProfileViewModel();

  @override
  void initState() {
    myGymViewModel.getOneGymEntry(loginViewModel.userId);
    super.initState();
  }

  @override
  void dispose() {
    _startWeightController.dispose();
    _goalWeightController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String label, String hint) {
    return InputDecoration(
      hintText: hint,
      labelText: label,
      hintStyle: TextStyle(color: Colors.black45),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black54, width: 2.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black54, width: 2.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Personal Settings"),
        ),
        body:FutureBuilder(
          future: myGymViewModel.getOneGymEntry(loginViewModel.userId),
          builder:(context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
            } else{
              return SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "NEVER GIVE UP",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),

                    TextFormField(
                      controller: _startWeightController,
                      decoration: _inputDecoration("Start weight",myGymViewModel.gymEntry.startWeight ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _goalWeightController,
                      decoration: _inputDecoration("Goal weight", myGymViewModel.gymEntry.goalWeight),
                    ),
                    SizedBox(height: 40.0),
                    ElevatedButton(
                      onPressed: () async{
                        if(_startWeightController.text==""){
                          myGymViewModel.setStartWeight(myGymViewModel.gymEntry.startWeight);
                        }else{
                          myGymViewModel.setStartWeight(_startWeightController.text);
                        }

                        if(_goalWeightController.text==""){
                          myGymViewModel.setGoalWeight(myGymViewModel.gymEntry.goalWeight);
                        }else{
                          myGymViewModel.setGoalWeight(_goalWeightController.text);
                        }

                        int statusCode = await myGymViewModel.updateEntryGym(loginViewModel.findUser.entryId);

                        if(context.mounted){
                          if (statusCode == 200 || statusCode == 201) {
                            if(context.mounted){
                              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                content: const Text( "Updated successful!"),backgroundColor: Colors.green.shade700,
                              ));
                            }
                            await Future.delayed(const Duration(seconds: 2));
                            Navigator.pop(context);

                          }else {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Error")),
                            );

                          }
                        }
                      },
                      child: Text('Update Goal',style: TextStyle(color: Colors.white)),
                      style:  ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade700
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        )

    );
  }
}