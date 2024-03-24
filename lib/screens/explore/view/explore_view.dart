import 'package:fitbull/widgets/event_card.dart';
import 'package:flutter/material.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              const Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Gyms",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Muğla, Turkey",

                        style: TextStyle(color: Colors.black, fontSize: 14),
                        textAlign: TextAlign.center,

                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(children: [
          ///TODO LATER
       /*   Expanded(
            child: Image.asset(
              "assets/home/img.png",
              width: double.infinity, // Genişlik tam ekran genişliği kadar
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),*/
          Expanded(
              child: ExploreList(items: [
                CardItem(
                    image: "assets/home/img_1.png",
                    name: "Acaademy",
                    address: "Kötekli mah.",
                    price: "90 TL", rating: "4.3"),
                CardItem(
                    image: "assets/home/img_1.png",
                    name: "Acaademy",
                    address: "Kötekli mah.",
                    price: "90 TL",
                    rating: "4.3"),
                CardItem(
                    image: "assets/home/img_1.png",
                    name: "Acaademy",
                    address: "Kötekli mah.",
                    price: "90 TL",
                    rating: "4.3"),
                CardItem(
                    image: "assets/home/img_1.png",
                    name: "Acaademy",
                    address: "Kötekli mah.",
                    price: "90 TL",
                    rating: "4.3"),
                CardItem(
                    image: "assets/home/img_1.png",
                    name: "Acaademy",
                    address: "Kötekli mah.",
                    price: "90 TL",
                    rating: "4.3"),
              ]))
        ]));
  }
}