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
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Stack(
          children: [
            Expanded(
              child: Container(
                height: 180.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.items.length,
                  itemBuilder: (context, index) {
                    return EventCard(
                      item: widget.items[index],
                      isActive: index == currentIndex,
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
  final String name;
  final String address;
  final String capacity;

  CardItem({
    required this.name,
    required this.address,
    required this.capacity,
  });
}

class EventCard extends StatelessWidget {
  final CardItem item;
  final bool isActive;

  const EventCard({
    Key? key,
    required this.item,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12, // Set the border color
          width: 1.0, // Set the border width
        ),
        color: isActive ? Colors.grey : Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.name,
            style: TextStyle(
              color: isActive ? Colors.black : Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            item.address,
            style: TextStyle(
              color: isActive ? Colors.black : Colors.black,
              fontSize: 14.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            item.capacity,
            style: TextStyle(
              color: isActive ? Colors.black : Colors.black,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}