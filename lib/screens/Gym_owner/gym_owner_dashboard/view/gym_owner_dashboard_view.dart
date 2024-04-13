import 'package:fitbull/screens/Gym_owner/gym_owner_dashboard/viewModel/gym_owner_dashboard_view_model.dart';
import 'package:fitbull/screens/Gym_owner/gym_owner_edit_profile/view/gym_owner_edit_profile_view.dart';
import 'package:fitbull/screens/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../create_activity/view/create_activity_view.dart';
import '../../create_educator/view/create_educator_view.dart';
import '../../detail_screen_posts/view/deatil_screen_posts_view.dart';

class GymOwnerDashboard extends StatefulWidget {
  @override
  State<GymOwnerDashboard> createState() => _GymOwnerDashboardState();


}


class _GymOwnerDashboardState extends State<GymOwnerDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future? _loadingFuture;


  @override
  void initState()  {
    super.initState();
    _loadData();

  }

  Future<void> _loadData() async {
    setState(() {
      _loadingFuture = Future.wait([
        gymOwnerDashboardViewModel.fetchGym(),
        gymOwnerDashboardViewModel.fetchActivity(),
        gymOwnerDashboardViewModel.fetchEducator(),
      ]);
    });

  }


  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: RefreshIndicator(
            onRefresh: () async {
              await _loadData();
            },
            child: FutureBuilder(
              future: _loadingFuture,
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {

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
                        gymOwnerDashboardViewModel.gym.name??"dd",
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
                                    );
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.edit),
                                  title: Text('Edit Profile'),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>   GymOwnerEditProfile()),
                                    );
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
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>   LoginPage()),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    body: Column(
                      children: [
                        // Your column content, for example:
                        _buildProfileHeader(context),
                        _buildHighlightSection(context),
                        _selectedIndex == 0
                            ? _buildPostSection(context)
                            : _selectedIndex == 1
                            ? _buildEducatorSection()
                            : _buildUserSection(),
                      ],

                    ),
                  );
                }
              },
            )

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
            foregroundImage: AssetImage("assets/home/teacher.png"),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(gymOwnerDashboardViewModel.activityList.length.toString(), style: TextStyle(fontSize: 18)),
                  Text('Activity', style: TextStyle(fontSize: 18)),
                ],
              ),
              Column(
                children: [
                  Text(gymOwnerDashboardViewModel.educatorList.length.toString(), style: TextStyle(fontSize: 18)),
                  Text('Educators', style: TextStyle(fontSize: 18)),
                ],
              ),
              Column(
                children: [
                  Text(gymOwnerDashboardViewModel.gym.capacity, style: TextStyle(fontSize: 18)),
                  Text('Capacity', style: TextStyle(fontSize: 18)),

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
        itemCount: gymOwnerDashboardViewModel.activityList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          var activity =gymOwnerDashboardViewModel.activityList[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailScreenPosts(
                    items:gymOwnerDashboardViewModel.activityList
                ),
              ));

            },
            child: Image.asset(
              "assets/home/competition.png",//TODO added real photo
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
        itemCount: gymOwnerDashboardViewModel.educatorList.length,
        itemBuilder: (context, index) {
          var educator = gymOwnerDashboardViewModel.educatorList[index];
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