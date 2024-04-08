import 'package:fitbull/screens/Customer/dashboard/view/dashboard_view.dart';
import 'package:fitbull/screens/Customer/my_gym/view/my_gym_view.dart';
import 'package:fitbull/screens/Customer/reels/view/reels_view.dart';
import 'package:fitbull/screens/Gym_owner/gym_owner_gym/view/gym_owner_gym_view.dart';
import 'package:fitbull/screens/profile/view/profile_view.dart';
import 'package:flutter/material.dart';


class GymOwnerHomeSplashView extends StatefulWidget {
  const GymOwnerHomeSplashView({Key? key}) : super(key: key);

  @override
  _GymOwnerHomeSplashViewState createState() => _GymOwnerHomeSplashViewState();
}

class _GymOwnerHomeSplashViewState extends State<GymOwnerHomeSplashView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
         GymOwnerGym(),
          GymOwnerGym(),
          GymOwnerGym(),


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
              text: "Create Activity",
            ),
            Tab(
              icon: Icon(Icons.computer),
              text: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}