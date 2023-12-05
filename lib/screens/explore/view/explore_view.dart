import 'package:flutter/cupertino.dart';
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
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                )),
            const Expanded(
                child: Text(
                  "Gyms",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
      body: ElevatedButton(onPressed: () {}, child: Text("sevval")),
    );
  }
}