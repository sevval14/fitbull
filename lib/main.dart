import 'package:fitbull/screens/explore/view/explore_view.dart';
import 'package:fitbull/screens/information/view/information_view.dart';
import 'package:fitbull/screens/login/view/login_view.dart';
import 'package:fitbull/screens/my_gym/view/my_gym_view.dart';
import 'package:fitbull/screens/profile/view/profile_view.dart';
import 'package:fitbull/screens/register/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:fitbull/screens/dashboard/view/dashboard_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home:  MyTabBar(),
        debugShowCheckedModeBanner: false
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
    return LoginPage();
  }
}