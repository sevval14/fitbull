import 'package:fitbull/screens/create_activity/view/create_activity_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../create_gym/view/create_gym_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      fontWeight: FontWeight.w300), // İkinci kısımın rengi
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
                backgroundImage: NetworkImage('https://static-prod.adweek.com/wp-content/uploads/2023/01/WhatsApp-Avatar-Profile-Photo-Hero-652x367.png'), // Kullanıcının profil resminin URL'si
              ),
              const SizedBox(height: 8),
              const Text(
                'Şevval Beyza',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 20), // Avatar ile kartlar arasında boşluk bırakın
          Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('Create Gym'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  CreateGymPage()),
                );
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: const Icon(Icons.directions_run),
              title: const Text('Create Activity'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  CreateActivityPage()));              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Educator'),
              onTap: () {
                // Educator sayfasına yönlendirme
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Log Out'),
              onTap: () {
                // Logout işlemi
              },
            ),
          ),
        ],
      ),
    );
  }
}
