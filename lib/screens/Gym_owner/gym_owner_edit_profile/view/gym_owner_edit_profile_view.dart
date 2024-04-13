import 'package:fitbull/screens/Gym_owner/create_gym/viewModel/create_gym_view_model.dart';
import 'package:fitbull/screens/Gym_owner/gym_owner_dashboard/viewModel/gym_owner_dashboard_view_model.dart';
import 'package:fitbull/screens/Gym_owner/gym_owner_edit_profile/view_model/gym_owner_edit_profile_view_model.dart';
import 'package:flutter/material.dart';

import '../../gym_owner_dashboard/view/gym_owner_dashboard_view.dart';

class GymOwnerEditProfile extends StatefulWidget {
  @override
  _GymOwnerEditProfileState createState() => _GymOwnerEditProfileState();
}

class _GymOwnerEditProfileState extends State<GymOwnerEditProfile> {
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _imagePathController = TextEditingController();
  final _startHourController = TextEditingController();
  final _endHourController = TextEditingController();
  final _taxNumberController = TextEditingController();
  final _websiteController = TextEditingController();
  final GymOwnerEditProfileViewModel gymOwnerEditProfile = GymOwnerEditProfileViewModel();

  @override
  void initState()  {
    super.initState();
    gymOwnerDashboardViewModel.fetchGym();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _imagePathController.dispose();
    _startHourController.dispose();
    _endHourController.dispose();
    _taxNumberController.dispose();
    _websiteController.dispose();
    super.dispose();
  }


  void _submitForm(BuildContext context) async{
    gymOwnerEditProfile.setName(_nameController.text);
    gymOwnerEditProfile.setLocation(_locationController.text);
    gymOwnerEditProfile.setImagePath(_imagePathController.text);
    gymOwnerEditProfile.setStartHour(_startHourController.text);
    gymOwnerEditProfile.setEndHour(_endHourController.text);
    gymOwnerEditProfile.setTaxNumber(_taxNumberController.text);
    gymOwnerEditProfile.setWebSite(_websiteController.text);

    int statusCode = await gymOwnerEditProfile.updateGym();

    if(context.mounted){
      if (statusCode == 200 || statusCode == 201) {
        if(context.mounted){
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            content: const Text( "Gym updated successful!"),backgroundColor: Colors.green.shade700,
          ));
        }
        await Future.delayed(const Duration(seconds: 2));
        if(context.mounted){
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>  GymOwnerDashboard()),
          );

        }



      }else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Educator already exists")),
        );

      }
    }


  }

  @override
  Widget build(BuildContext context) {
    print(createGymViewModel.name)
;    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile',style: TextStyle(color: Colors.blueGrey.shade700,fontWeight: FontWeight.w500)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // Implement image picker logic
                print('Change profile image');
              },
              child: Container(
                padding: EdgeInsets.all(2),  // Dış sınır ile iç avatar arasında boşluk oluşturur.
                decoration: BoxDecoration(
                  color: Colors.blueGrey,  // Dış sınırın rengi
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/home/teacher.png'),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      radius: 16,
                      child: Icon(
                        Icons.edit,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )

            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: gymOwnerDashboardViewModel.gym.name,
                labelText: "Name",
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
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(
                hintText: gymOwnerDashboardViewModel.gym.location,
                labelText: "Location",
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
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _startHourController,
              decoration: InputDecoration(
                hintText: gymOwnerDashboardViewModel.gym.startHour,
                labelText: "Start Hour",
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
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _endHourController,
              decoration: InputDecoration(
                hintText: gymOwnerDashboardViewModel.gym.endHour,
                labelText: "End Hour",
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
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _websiteController,
              decoration: InputDecoration(
                hintText: gymOwnerDashboardViewModel.gym.webSite =="" ? 'no website':gymOwnerDashboardViewModel.gym.webSite,
                labelText: "Web site",
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
              ),
            ),

            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                    _submitForm(context);
                    print('Profile Updated');
                },
                child: Text('Edit',style: TextStyle(color: Colors.white),),
                style:  ElevatedButton.styleFrom(
                 backgroundColor: Colors.blueGrey.shade700 // Butonun iç padding'ini ayarlar
                ),


              ),
            ),
          ],
        ),
      ),
    );
  }
}
