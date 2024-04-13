import 'package:fitbull/screens/Customer/detail_gym/view_model/detail_gym_view_model.dart';
import 'package:flutter/material.dart';

class DetailGymView extends StatefulWidget {
  final int id;

  DetailGymView({required this.id});

  @override
  _DetailGymViewState createState() => _DetailGymViewState();
}

class _DetailGymViewState extends State<DetailGymView> {

  @override
  void initState() {
    super.initState();
    detailGymViewModel.fetchGym(widget.id);
  }

  @override
  void dispose() {
    detailGymViewModel.fetchGym(widget.id);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: detailGymViewModel.fetchGym(widget.id), // Assuming this is a Future that fetches gym details
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show loading spinner while waiting
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Show error if something went wrong
          } else {
            // Once the data is fetched, you can display your widgets
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/home/macFit.png'), // Replace with actual path to gym image
                  SizedBox(height: 8),
                  Text(snapshot.data.name, // Assuming the gym details are in this data structure
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  DefaultTabController(
                    length: 5,
                    child: Column(
                      children: <Widget>[
                        const TabBar(
                          automaticIndicatorColorAdjustment: true,
                          tabs: [
                            Tab(text: 'About'),
                            Tab(text: 'Educators'),
                            Tab(text: 'Services'),
                            Tab(text: 'Activities'),
                            Tab(text: 'Equipment'),
                          ],
                        ),
                        Container(
                          height: 300, // Arbitrary height for the tab content
                          child: TabBarView(
                            children: <Widget>[
                              Center(child: Text('About content goes here')),
                              Center(child: Text('Educators content goes here')),
                              Center(child: Text('Services content goes here')),
                              Center(child: Text('Activities content goes here')),
                              Center(child: Text('Equipment content goes here')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
