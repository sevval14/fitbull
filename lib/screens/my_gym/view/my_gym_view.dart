import 'package:fitbull/widgets/my_gym_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/card_list_mygym.dart';


class MyGymView extends StatefulWidget {
  MyGymView({Key? key}) : super(key: key);

  @override
  State<MyGymView> createState() => _MyGymViewState();
}

class _MyGymViewState extends State<MyGymView> {
  MyGymActivities myGymActivities = new MyGymActivities(
      "assets/home/competition.png", "Halter", "12.02.2022", "100 Tl");
  MyTeacher teacher = new MyTeacher("Özgür Hocam", "assets/home/özgür.png", "05549875657");

  late MyGymInfo myGymInfo =
  MyGymInfo("MacFit", "assets/home/macFit.png", "0.10", [myGymActivities],[teacher]);

  @override
  Widget build(BuildContext context) {
    double capacityAsInteger = double.parse(myGymInfo.capacity);
    double finalCapacity = 1.0 - capacityAsInteger;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text(
            myGymInfo.name,
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
      body: Column(
        children: [
          Image.asset(myGymInfo.image),
          Text(
            "%${myGymInfo.capacity}- Full",
            style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(0, 67, 168, 1),
                fontWeight: FontWeight.w400),
          ),
          Container(
            height: 20.0, // Genel yükseklik
            color: Colors.grey, // Dıştaki Container'ın rengi (alt kısım)
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width *
                      1, // İçteki Container'ın genişliği %40
                  color: Color.fromRGBO(
                      0, 67, 168, 1), // İçteki Container'ın rengi (üst kısım)
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        finalCapacity, // Dıştaki Container'ın genişliği %60
                    color:
                    Colors.grey, // Dıştaki Container'ın rengi (alt kısım)
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            alignment: Alignment.centerRight,
            child: Text("08:00 -22:00",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
          ),
          Expanded(
              child: ListView(
                children: [
                  Container(),
                  CardList(
                    title: "Activity",
                    items: [
                      CardItem(
                          image: myGymActivities.image,
                          name: myGymActivities.name,
                          description:
                          myGymActivities.date + "\n " + myGymActivities.price),
                      CardItem(
                          image: myGymActivities.image,
                          name: myGymActivities.name,
                          description:
                          myGymActivities.date + "\n " + myGymActivities.price),
                      CardItem(
                          image: myGymActivities.image,
                          name: myGymActivities.name,
                          description:
                          myGymActivities.date + "\n " + myGymActivities.price),
                    ],
                  ),
                  CardList(
                    title: "Educator",
                    items: [
                      CardItem(
                        image: teacher.photo,
                        name: teacher.name,
                      ),
                      CardItem(
                        image: teacher.photo,
                        name: teacher.name,
                      ),
                      CardItem(
                        image: teacher.photo,
                        name: teacher.name,
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
