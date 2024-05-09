import 'package:fitbull/screens/Customer/personal_settings/view/personal_settings_view.dart';
import 'package:fitbull/screens/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../login/view/login_view.dart';
import '../../edit_profile/view/edit_user_profile_view.dart';
import '../../promotions/view/promotions_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: loginViewModel.findName(loginViewModel.userId.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: true,
              title: Container(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: 'Fit',
                    style: GoogleFonts.jua(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w300,
                      color: const Color.fromRGBO(0, 67, 168, 1),
                    ),
                    children: const [
                      TextSpan(
                        text: 'Bull',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight:
                            FontWeight.w300), // İkinci kısımın rengi
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                Column(
                  children: [
                    const SizedBox(height: 16),
                    CircleAvatar(
                      radius: 50, // Avatarın boyutunu ayarlayın
                      foregroundImage: AssetImage(
                          'assets/home/teacher.png'), // Kullanıcının profil resminin URL'si
                    ),
                    const SizedBox(height: 8),
                    Text(
                      loginViewModel.findUser.userName,
                      style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(
                    height: 20),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Edit Profile'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UserProfile()));
                    },
                  ),
                ),loginViewModel.findUser.entryId==0 ?const SizedBox():
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: const Icon(Icons.directions_run),
                    title: const Text('Personal Settings'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PersonalSettings()));
                    },
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: const Icon(Icons.card_giftcard),
                    title: const Text('Promotions'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PromotionsView()));
                    },
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text('Logout'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  ),
                ),

              ],
            ),
          );
        }
      },
    );

  }
  _buildCard(BuildContext context,String name ,IconData iconData, Widget directedPage){
    print(loginViewModel.findUser.entryId);
    if(name=='Personal Settings'&& loginViewModel.findUser.entryId==0){
      return SizedBox();
    }
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(iconData),
        title: Text(name),
        onTap: () {
          if(name == 'Logout'){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => directedPage));
          }

        },
      ),
    );
  }
}