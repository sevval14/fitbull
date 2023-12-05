import 'package:flutter/material.dart';
import 'package:fitbull/screens/home/view/home_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  MyTabBar(),
    );
  }
}

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: const[
           HomeView(),
           HomeView(),
           HomeView(),
           HomeView(),
           HomeView(),


          // Farklı sayfa eklemeleri
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          labelStyle: TextStyle(color: Colors.black),
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.black,
          controller: _tabController,
          tabs:const [
            Tab(
              icon: Icon(Icons.home),
              text: "Home",

            ),
            Tab(
              icon: Icon(Icons.location_on),
              text: "Explore",
            ),
            Tab(
              icon: Icon(Icons.fitness_center),
              text: "MyGym",
            ),
            Tab(
              icon: Icon(Icons.computer),
              text: "Info",
            ),
            Tab(
              icon: Icon(Icons.person),
              text: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
