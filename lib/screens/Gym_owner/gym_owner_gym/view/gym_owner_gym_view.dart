import 'package:fitbull/widgets/card_list_mygym.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


class GymOwnerGym extends StatefulWidget {

  @override
  State<GymOwnerGym> createState() => _GymOwnerGymState();
}

class _GymOwnerGymState extends State<GymOwnerGym> {
  final int totalMembers = 166; // Örnek üye sayısı
  final int maleMembers = 100; // Erkek üye sayısı
  final int femaleMembers = 66; // Kadın üye sayısı

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text(
            "MacFit",
            style: GoogleFonts.aBeeZee(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(0, 67, 168, 1),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              "assets/home/macFit.png", // Spor salonunun resmi
              fit: BoxFit.cover,
            ),
            Slider(
              value: 60,
              min: 0,
              max: 100,
              divisions: 100,
              label: '60%',
              onChanged: (double value) {
                // Kullanıcı doluluk oranını ayarladığında burada işleme alınabilir.
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: <Widget>[
                      Icon(Icons.access_time),
                      Text('08:00 - 22:00'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.location_on),
                      Text('Location'),
                    ],
                  ),
                  InkWell(
                    onTap: () => _launchURL('https://www.example.com'),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.web),
                        Text('Web site'),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.edit),
                      Text('Edit'),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Toplam Üye Sayısı: $totalMembers'),
              subtitle: Text('Erkek: $maleMembers Kadın: $femaleMembers'),
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(),
                CardList(
                  title: "Activity",
                  items: [
                    CardItem(
                        image: "assets/home/competition.png",
                        name:"Halter",
                        description:
                        "12.02.2022\n 100 Tl"),
                    CardItem(
                        image: "assets/home/competition.png",
                        name:"Halter",
                        description:
                        "12.02.2022\n 100 Tl"),
                    CardItem(
                        image: "assets/home/competition.png",
                        name:"Halter",
                        description:
                        "12.02.2022\n 100 Tl"),

                  ],
                ),
                CardList(
                  title: "Educator",
                  items: [
                    CardItem(
                      image:  "assets/dashboard/özgür.png",
                      name: "Özgür Hocam",
                    ),
                    CardItem(
                      image:  "assets/dashboard/özgür.png",
                      name: "Özgür Hocam",
                    ),
                  ],
                )
              ],
            )
            // Diğer widget'lar...
          ],
        ),
      ),
    );
  }
}
