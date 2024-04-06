import 'package:fitbull/screens/Customer/dashboard/view/dashboard_view.dart';
import 'package:fitbull/screens/Customer/my_gym/view/my_gym_view.dart';
import 'package:fitbull/screens/Customer/reels/view/reels_view.dart';
import 'package:fitbull/screens/profile/view/profile_view.dart';
import 'package:flutter/material.dart';


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
    _tabController = TabController(length: 4, vsync: this);
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
          const DashboardView(),
          MyGymView(),
          ReelsView(),
          ProfileView(),


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
              icon: Icon(Icons.fitness_center),
              text: "MyGym",
            ),
            Tab(
              icon: Icon(Icons.computer),
              text: "Reels",
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