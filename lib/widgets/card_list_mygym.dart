import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  final String title;
  final List<CardItem> items;

  const CardList({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 190.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return EventCard(
                item: widget.items[index],
              );
            },
          ),
        ),
      ],
    );
  }
}


class CardItem {
  final String image;
  final String? name; // Make it nullable
  final String? description; // Make it nullable
  // Make it nullable

  CardItem({
    required this.image,
    this.name,
    this.description,
  });
}

class EventCard extends StatelessWidget {
  final CardItem item;

  const EventCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12, // Set the border color
          width: 1.0, // Set the border width
        ),
        color:  Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(item.image,height: 100,),
          Text(
            " ${item.name}" ?? '',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,

            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            " ${item.description}" ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14.0,
            ),
          ),
          const SizedBox(height: 8.0),

        ],
      ),
    );
  }
}