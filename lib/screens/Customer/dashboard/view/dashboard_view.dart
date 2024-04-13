import 'package:fitbull/screens/Customer/dashboard/viewModel/dashboard_view_model.dart';
import 'package:fitbull/screens/Gym_owner/create_gym/model/create_gym_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../detail_gym/view/detail_gym_view.dart';


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
  @override
  void dispose()  {
    super.dispose();
    dashboardViewModel.fetchGym();
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
                  Expanded(
                    child: ListView.builder(
                      itemCount: dashboardViewModel.gymList.length,
                      itemBuilder: (context, index) {
                        final item = dashboardViewModel.gymList[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>   DetailGymView(id: item.id,)),
                            );
                          },
                          child: Card(
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(left:30,right:5,top:15,bottom:2),
                                              child: Text(item.name, style: TextStyle(color: Colors.black, fontSize: 18))
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left:30,right:5,top:5,bottom: 2),
                                            child: Text(item.location, style: TextStyle(color: Colors.black54, fontSize: 14)),
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
                                        child: Image.asset(
                                          "assets/home/macFit.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )

                                ],
                              ),
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