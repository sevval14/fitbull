

import 'package:flutter/material.dart';

import '../../create_activity/model/create_activity_model.dart';

class DetailScreenPosts extends StatelessWidget {
  final List<Activity> items;

  const DetailScreenPosts({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activities',style: TextStyle(fontSize: 25),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {
                      },
                    ),
                  ],
                ),
              ),
              Image.asset(
                "assets/home/competition.png", //TODO added real photo
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  item.description,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
