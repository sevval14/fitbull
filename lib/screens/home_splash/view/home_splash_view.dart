import 'package:fitbull/screens/explore/view/explore_view.dart';
import 'package:fitbull/screens/gym_form/view/create_gym_view.dart';
import 'package:fitbull/screens/information/view/information_view.dart';
import 'package:fitbull/screens/my_gym/view/my_gym_view.dart';
import 'package:fitbull/screens/profile/view/profile_view.dart';
import 'package:fitbull/screens/register/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:fitbull/screens/home/view/home_view.dart';


class HomeSplashView extends StatefulWidget {
  const HomeSplashView({Key? key}) : super(key: key);

  @override
  _HomeSplashViewState createState() => _HomeSplashViewState();
}

class _HomeSplashViewState extends State<HomeSplashView> with SingleTickerProviderStateMixin {
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
        children: [
          HomeView(),
          ExploreView(),
          MyGymView(),
          RegisterPage(),
          CreateGymPage(),


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