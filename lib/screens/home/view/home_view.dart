import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/card_list_mygym.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<String> imagePaths = [
    "assets/home/competition3.png",
    "assets/home/competition.png",
    "assets/home/competition2.png",
  ];

  void goToPreviousImage() {
    setState(() {
      currentIndex = (currentIndex - 1) % imagePaths.length;
    });
  }

  void goToNextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % imagePaths.length;
    });
  }

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
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(0, 67, 168, 1),
                ),
                children: const [
                  TextSpan(
                    text: 'Bull',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600), // İkinci kısımın rengi
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 25.0,
                  ),
                  const SizedBox(
                      width: 10.0), // Boşluk eklemek için SizedBox kullanıyoruz
                  const Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Cekmekoy/Istanbul',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  const Icon(
                    Icons.arrow_downward,
                    size: 25.0,
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: goToPreviousImage,
                          icon: const Icon(Icons.arrow_back),
                        ),
                        Expanded(
                          flex: 2,
                          child: Image.asset(imagePaths[currentIndex],height: 200,width: 200,),
                        ),
                        IconButton(
                          onPressed: goToNextImage,
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    CardList(
                      title: 'Gyms', // Liste başlığı
                      items: [
                        CardItem(
                          image: "assets/home/macFit.png",
                          name: 'Mac Fit',
                          description: 'Location 1 \n Capacity: %50',
                        ),
                        CardItem(
                          image: "assets/home/intense.png",
                          name: 'Intense',
                          description: 'Location 2 \n Capacity: %50 dolu',
                        ),
                        CardItem(
                          image: "assets/home/academy.png",
                          name: 'Academy',
                          description: 'Location 3 \n Capacity: %60 dolu',
                        ),
                        // Daha fazla etkinlik ekleyebilirsiniz
                      ],
                    ),
                    const SizedBox(height: 10,),

                    CardList(
                      title: 'Equipment', // Liste başlığı
                      items: [
                        CardItem(
                          image: "assets/home/latPulldown.png",
                          name: 'Lat Pulldown',
                          description: 'This equipment is a popular exercise performed using a cable machine or a specially designed lat pulldown machine in a gym. Here s an explanation of how to perform the Lat Pulldown exercise',
                        ),
                        CardItem(
                          image: "assets/home/peckDeckFly.png",
                          name: 'Peck Deck Fly',
                          description: 'This exercise equipment helps muscles other than the chest to become more defined and firm',
                        ),
                        CardItem(
                          image: "assets/home/legExtension.png",
                          name: 'Leg Extension',
                          description: 'While working on the upper leg muscles,leg curl exercises target the muscles in the back of the legs.. read more',
                        ),
                        // Daha fazla etkinlik ekleyebilirsiniz
                      ],
                    ),

                  ],
                ))
          ],
        ));
  }
}
