import 'package:fitbull/screens/Customer/edit_profile/view_model/edit_user_profile_view_model.dart';
import 'package:fitbull/screens/Customer/profile/view/profile_view.dart';
import 'package:fitbull/screens/login/viewmodel/login_view_model.dart';
import 'package:fitbull/screens/register/model/userResponse.dart';
import 'package:flutter/material.dart';

import '../../../Gym_owner/qr_code/view_model/qr_code_view_model.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final EditProfileViewModel editProfileViewModel =  EditProfileViewModel();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
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
          title: Text("User Profile"),
        ),
        body:FutureBuilder(
          future: loginViewModel.findName(loginViewModel.userId.toString()),
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
                    Column(
                      children: [
                        const SizedBox(height: 16),
                        CircleAvatar(
                          radius: 50, // Avatarın boyutunu ayarlayın
                          foregroundImage: AssetImage('assets/home/teacher.png'), // Kullanıcının profil resminin URL'si
                        ),
                        const SizedBox(height: 8),
                        Text(
                          loginViewModel.findUser.userName,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),

                    TextFormField(
                      controller: _usernameController,
                      decoration: _inputDecoration("Username",loginViewModel.findUser.userName ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _emailController,
                      decoration: _inputDecoration("Email", loginViewModel.findUser.email),
                    ),
                    SizedBox(height: 40.0),
                    ElevatedButton(
                      onPressed: () async{
                        if(_usernameController.text==""){
                          editProfileViewModel.setUserName(loginViewModel.findUser.userName);
                        }else{
                          editProfileViewModel.setUserName(_usernameController.text);
                        }

                        if(_emailController.text==""){
                          editProfileViewModel.setEmail(loginViewModel.findUser.email);
                        }else{
                          editProfileViewModel.setEmail(_emailController.text);
                        }

                        int statusCode = await editProfileViewModel.updateProfile();

                        if(context.mounted){
                          if (statusCode == 200 || statusCode == 201) {
                            if(context.mounted){
                              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                content: const Text( "Updated successful!"),backgroundColor: Colors.green.shade700,
                              ));
                            }
                            await Future.delayed(const Duration(seconds: 2));

                          }else {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Error")),
                            );

                          }
                        }
                      },
                      child: Text('Update Profile',style: TextStyle(color: Colors.white)),
                      style:  ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade700 // Butonun iç padding'ini ayarlar
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