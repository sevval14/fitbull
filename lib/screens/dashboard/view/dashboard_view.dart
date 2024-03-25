import 'package:fitbull/screens/create_gym/model/create_gym_model.dart';
import 'package:fitbull/screens/dashboard/viewModel/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/card_list_mygym.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final DashboardViewModel dashboardViewModel = DashboardViewModel();
  @override
  void initState()  {
    super.initState();
     dashboardViewModel.fetchGym();
  }

  int currentIndex = 0;
  List<String> imagePaths = [
    "assets/dashboard/competition3.png",
    "assets/dashboard/competition.png",
    "assets/dashboard/competition2.png",
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
        body: FutureBuilder<List<Gym>>(
          future: dashboardViewModel.fetchGym(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Tekrar dene'));
            } else {
              // Veriler başarıyla yüklendi, içeriği göster
              return Column(
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
                  Expanded(flex:1,child: Row(
                    children: [
                      IconButton(
                        onPressed: goToPreviousImage,
                        icon: const Icon(Icons.arrow_back),
                      ),
                      Expanded(
                        flex: 2,
                        child: Image.asset(imagePaths[currentIndex],height: 500,width: 200,),
                      ),
                      IconButton(
                        onPressed: goToNextImage,
                        icon: const Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),),

                  Expanded(flex:3,child: ListView(
                      children: [Container(height: 200,child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dashboardViewModel.gymList.length,
                        itemBuilder: (context, index) {
                          final item = dashboardViewModel.gymList[index];
                          return Card(
                            child: Container(
                              width: 160, // Kartların genişliği
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Expanded(child: Image.network(item.imagePath, height: 100)),
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    "${item.location} ${item.capacity}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                ],
                              ),
                            ),
                          );
                        },
                      ),),
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
                        ),])),


                ],
              );
            }
          },
        ),


    );
  }
}