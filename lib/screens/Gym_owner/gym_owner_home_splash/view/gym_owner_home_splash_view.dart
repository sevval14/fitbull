import 'package:fitbull/screens/Gym_owner/create_educator/view/create_educator_view.dart';
import 'package:fitbull/screens/Gym_owner/create_gym/view/create_gym_view.dart';
import 'package:fitbull/screens/Gym_owner/gym_owner_dashboard/view/gym_owner_dashboard_view.dart';
import 'package:fitbull/screens/login/viewmodel/gym_owner_login_view_model.dart';
import 'package:flutter/material.dart';

import '../../create_activity/view/create_activity_view.dart';


class GymOwnerHomeSplashView extends StatefulWidget {
  const GymOwnerHomeSplashView({Key? key}) : super(key: key);

  @override
  _GymOwnerHomeSplashViewState createState() => _GymOwnerHomeSplashViewState();
}

class _GymOwnerHomeSplashViewState extends State<GymOwnerHomeSplashView> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return gymOwnerLoginViewModel.gymOwnerGymId != 0 ?Scaffold(
        key: _scaffoldKey,
        body:GymOwnerDashboard() // Your ProfileScreen widget here
    ):CreateGymPage(); // Your ProfileScreen widget here


  }
}