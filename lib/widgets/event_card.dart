import 'package:flutter/material.dart';
class ExploreList extends StatefulWidget {
  final List<CardItem> items;

  const ExploreList({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  _ExploreListState createState() => _ExploreListState();
}

class _ExploreListState extends State<ExploreList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Expanded(
              child: Container(
                height: 340.0,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: widget.items.length,
                  itemBuilder: (context, index) {
                    return ExploreCard(
                      item: widget.items[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
class CardItem {
  final String image;
  final String name;
  final String address;
  final String price;
  final String rating;

  CardItem({
    required this.image,
    required this.name,
    required this.address,
    required this.price,
    required this.rating,
  });
}

class ExploreCard extends StatelessWidget {
  final CardItem item;

  const ExploreCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(245, 245, 245, 1),
          borderRadius: BorderRadius.circular(20.0),
        ),
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
                      child: Text(item.address, style: TextStyle(color: Colors.black54, fontSize: 14)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left:30,right:5,top:5), // İstenilen margin değerleri
                      child: Text(item.price, style: TextStyle(color: Colors.black54, fontSize: 16)),
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
                              item.rating,
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
                  color: Colors.white38,
                ),
                width: 70, // Container'ın genişliğini belirtin
                height: 120, // Container'ın yüksekliğini belirtin
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/home/img_1.png', // Resim yolu düzgün bir şekilde belirtilmiş olmalı
                    fit: BoxFit.cover, // Resmin boyutlandırılma türü
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
