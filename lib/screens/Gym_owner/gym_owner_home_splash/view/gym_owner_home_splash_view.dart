import 'package:flutter/material.dart';

import '../../create_gym/create_activity/view/create_activity_view.dart';
import '../../gym_owner_profile/view/gym_owner_profile.dart';


class GymOwnerHomeSplashView extends StatefulWidget {
  const GymOwnerHomeSplashView({Key? key}) : super(key: key);

  @override
  _GymOwnerHomeSplashViewState createState() => _GymOwnerHomeSplashViewState();
}

class _GymOwnerHomeSplashViewState extends State<GymOwnerHomeSplashView> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(
          'Academy Fit',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              // Notification icon action
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      'Fitbull',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.insert_chart),
                    title: Text('Daily Statistics'),
                    onTap: () {
                      // Add your onTap code here
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.create),
                    title: Text('Create Activity'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateActivityPage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.school),
                    title: Text('Add Educator'),
                    onTap: () {
                      // Add your onTap code here
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Edit Profile'),
                    onTap: () {
                      // Add your onTap code here
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      // Add your onTap code here
                    },
                  ),
                  // Add other sections here
                ],
              ),
            ),
            // Logout section
            Align(
              alignment: FractionalOffset.bottomLeft,
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () {
                  // Handle the logout tap
                },
              ),
            ),
          ],
        ),
      ),


      body: ProfileScreen(), // Your ProfileScreen widget here
    );
  }
}