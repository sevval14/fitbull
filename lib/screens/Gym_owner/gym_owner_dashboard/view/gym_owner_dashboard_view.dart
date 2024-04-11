import 'package:fitbull/screens/Gym_owner/gym_owner_dashboard/viewModel/gym_owner_dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../create_activity/model/create_activity_model.dart';
import '../../create_activity/view/create_activity_view.dart';
import '../../create_educator/view/create_educator_view.dart';

class GymOwnerDashboard extends StatefulWidget {
  @override
  State<GymOwnerDashboard> createState() => _GymOwnerDashboardState();


}

class DetailScreen extends StatelessWidget {
  final List<Activity> items;

  const DetailScreen({Key? key, required this.items}) : super(key: key);

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
                        style: TextStyle(fontSize: 20),
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
              Image.network(
                item.imagePath,
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


class _GymOwnerDashboardState extends State<GymOwnerDashboard> {
  final GymOwnerDashboardViewModel _gymOwnerDashboardViewModel = GymOwnerDashboardViewModel();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState()  {
    super.initState();
    _gymOwnerDashboardViewModel.fetchActivity();
    _gymOwnerDashboardViewModel.fetchEducator();

  }


  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
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
                      const DrawerHeader(
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>   CreateEducatorView()),
                          );                      },
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
          body: Column(
            children: [
              _buildProfileHeader(context),
              _buildHighlightSection(context),
              _selectedIndex == 0
                  ? _buildPostSection(context)
                  : _selectedIndex == 1
                  ? _buildEducatorSection()
                  : _buildUserSection(),
            ],
          ),
        )
    );
  }
  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.grey,
            // Normally you would use a NetworkImage here
            backgroundImage: AssetImage('assets/home/macFit.png'),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Activity', style: TextStyle(fontSize: 18)),
                  Text(_gymOwnerDashboardViewModel.activityList.length.toString(), style: TextStyle(fontSize: 18)),
                ],
              ),
              Column(
                children: [
                  Text('Educators', style: TextStyle(fontSize: 18)),
                  Text(_gymOwnerDashboardViewModel.educatorList.length.toString(), style: TextStyle(fontSize: 18)),
                ],
              ),
              Column(
                children: [
                  Text('Capacity', style: TextStyle(fontSize: 18)),
                  Text('126', style: TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),
          SizedBox(height: 30,),



        ],
      ),
    );
  }

  Widget _buildHighlightSection(BuildContext context) {
    return Container(
      height: 70,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Düğmeler arasında eşit mesafe sağlar
          children: <Widget>[
            _buildIconButton(Icons.fitness_center, 'Activities', 0),
            _buildIconButton(Icons.school, 'Educator', 1),
            _buildIconButton(Icons.person, 'User', 2),
          ],
        )


        // Rest of your page content goes here
      ]),
    );
  }

  Widget _buildIconButton(IconData icon, String label, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          icon: Icon(
            icon,
            color: _selectedIndex == index ? Colors.blue : Colors.black54,
          ),
        ),
        Container(
          height: 2,
          width: 30,
          color: _selectedIndex == index ? Colors.blue : Colors.transparent,
        ),
        Text(
          label, // Burada metin etiketini kullanıyoruz.
          style: TextStyle(
            color: _selectedIndex == index ? Colors.blue : Colors.black54,
          ),
        )
      ],
    );
  }

  Widget _buildPostSection(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: _gymOwnerDashboardViewModel.activityList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          var activity =_gymOwnerDashboardViewModel.activityList[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailScreen(
                  items:_gymOwnerDashboardViewModel.activityList
                ),
              ));

            },
            child: Image.network(
              activity.imagePath,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  Widget _buildEducatorSection() {
    return Expanded(
      child: ListView.builder(
        itemCount: _gymOwnerDashboardViewModel.educatorList.length,
        itemBuilder: (context, index) {
          var educator = _gymOwnerDashboardViewModel.educatorList[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(educator.imagePath),
            ),
            title: Text(educator.name),
            subtitle: Text(educator.branch),
            trailing: IconButton(
              icon: Icon(Icons.phone),
              onPressed: () async {
                var url = 'tel:${educator.phoneNumber}';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  print('Could not launch $url');
                }              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildUserSection() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container();
        },
      ),
    );
  }
}




