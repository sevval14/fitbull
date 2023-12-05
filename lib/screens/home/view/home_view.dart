import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/card_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                    size: 30.0,
                  ),
                  const SizedBox(
                      width: 10.0), // Boşluk eklemek için SizedBox kullanıyoruz
                  const Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Cekmekoy/Istanbul',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  const Icon(
                    Icons.arrow_downward,
                    size: 30.0,
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
                        onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                    Expanded(
                      flex: 2,
                      child: Image.asset("assets/home/maraton.png"),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward)),
                  ],
                ),
                CardList(
                  title: 'Gyms', // Liste başlığı
                  items: [
                    CardItem(
                      name: 'Event 1',
                      address: 'Location 1',
                      capacity: 'Capacity: 50',
                    ),
                    CardItem(
                      name: 'Event 2',
                      address: 'Location 2',
                      capacity: 'Capacity: 100',
                    ),
                    CardItem(
                      name: 'Event 2',
                      address: 'Location 2',
                      capacity: 'Capacity: 100',
                    ),
                    // Daha fazla etkinlik ekleyebilirsiniz
                  ],
                ),
                CardList(
                  title: 'Activity', // Liste başlığı
                  items: [
                    CardItem(
                      name: 'Event 1',
                      address: 'Location 1',
                      capacity: 'Capacity: 50',
                    ),
                    CardItem(
                      name: 'Event 2',
                      address: 'Location 2',
                      capacity: 'Capacity: 100',
                    ),
                    CardItem(
                      name: 'Event 2',
                      address: 'Location 2',
                      capacity: 'Capacity: 100',
                    ),
                    // Daha fazla etkinlik ekleyebilirsiniz
                  ],
                )
              ],
            ))
          ],
        ));
  }
}
