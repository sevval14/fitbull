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
                        child: new Image.network("https://cdnuploads.aa.com.tr/uploads/sirkethaberleri/Contents/2023/09/24/thumbs_b_c_f08cd87214e22d06c91a394c8b9910c3.jpg",height: 500,width: 200,),
                      ),
                      IconButton(
                        onPressed: goToNextImage,
                        icon: const Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),),
                  SizedBox(height: 15,),
                  Container(
                    height: 1,
                    width: double.infinity, // Çizginin genişliği, kullanılabilir tüm alanı kaplasın
                    decoration: BoxDecoration(
                      color: Colors.white, // Çizginin rengi
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // Gölgelik rengi
                          spreadRadius: 1, // Gölgelik genişliği
                          blurRadius: 10, // Gölgelik bulanıklığı
                        ),
                      ],
                    ),
                  )
,
                  Expanded(
                    flex: 3, // Kartların ve içeriğin esnekliğini ayarlamak için
                    child: ListView.builder(
                      itemCount: dashboardViewModel.gymList.length,
                      itemBuilder: (context, index) {
                        final item = dashboardViewModel.gymList[index];
                        return Card(
                          shadowColor: Colors.white,
                          color: Colors.white,
                          surfaceTintColor:Colors.white ,
                          margin: EdgeInsets.all(10.0),
                          elevation: 5.0,
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                // Sağ taraftaki resim
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Yazıların sola hizalanması için
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(left:30,right:5,top:15,bottom:2), // İstenilen margin değerleri
                                            child: Text(item.name, style: TextStyle(color: Colors.black, fontSize: 18))
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left:30,right:5,top:5,bottom: 2), // İstenilen margin değerleri
                                          child: Text(item.location, style: TextStyle(color: Colors.black54, fontSize: 14)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left:30,right:5,top:5), // İstenilen margin değerleri
                                          child: Text("price", style: TextStyle(color: Colors.black54, fontSize: 16)),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(Icons.star, color: Colors.yellow), padding:  EdgeInsets.only(left:25, right: 5)
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 5, bottom: 2),
                                                child: Text(
                                                  "4.3",
                                                  style: TextStyle(color: Colors.black54, fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )


                                      ],
                                    ),
                                  ),
                                )
                                ,


                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    width: 70,
                                    height: 120,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        item.imagePath,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )

                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),





                ],
              );
            }
          },
        ),


    );
  }
}