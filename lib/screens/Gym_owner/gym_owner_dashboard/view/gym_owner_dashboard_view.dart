import 'package:fitbull/screens/Customer/detail_gym/view_model/detail_gym_view_model.dart';
import 'package:fitbull/screens/Gym_owner/create_equipment/view/create_equipment_view.dart';
import 'package:fitbull/screens/Gym_owner/create_services/view/create_services_view.dart';
import 'package:fitbull/screens/Gym_owner/gym_owner_edit_profile/view/gym_owner_edit_profile_view.dart';
import 'package:fitbull/screens/Gym_owner/qr_code/view/qr_code_view.dart';
import 'package:fitbull/screens/Gym_owner/total_users/view/total_users_view.dart';
import 'package:fitbull/screens/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../widgets/gym_properties.dart';
import '../../../login/viewmodel/gym_owner_login_view_model.dart';
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
        detailGymViewModel.fetchGym(gymOwnerLoginViewModel.gymOwnerGymId),
        detailGymViewModel.fetchActivity(gymOwnerLoginViewModel.gymOwnerGymId),
        detailGymViewModel.fetchEducator(gymOwnerLoginViewModel.gymOwnerGymId),
        detailGymViewModel.fetchService(gymOwnerLoginViewModel.gymOwnerGymId),
        detailGymViewModel.fetchEquipment(gymOwnerLoginViewModel.gymOwnerGymId),


      ]);
    });

  }


  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    Widget _buildSelectedSection(BuildContext context) {
      switch (_selectedIndex) {
        case 0:
          return _buildPostSection(context);
        case 1:
          return _buildEducatorSection(context);
        case 2:
          return Container(
            alignment: Alignment.topLeft,
              child: buildService(context));
        case 3:
          return buildEquipmentsSection(context);
        default:
          return Container(); // This could be a placeholder or an error widget
      }
    }
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
                        detailGymViewModel.gym.name??"dd",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      centerTitle: true,
                      actions: <Widget>[
                        IconButton(
                          icon: Icon(Icons.qr_code),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => QRCodeView()));

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
                                    color: Colors.deepPurple,
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.sports_gymnastics,color: Colors.white,size: 35,),
                                      SizedBox(width: 10,),
                                      Text(
                                        'Fitbull',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 26,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),
                                ListTile(
                                  leading: Icon(Icons.insert_chart ,color: Colors.deepPurple,),
                                  title: Text('Daily Statistics'),
                                  onTap: () {
                                    // Add your onTap code here
                                  },
                                ),
                                SizedBox(height: 5,),
                                ListTile(
                                  leading: Icon(Icons.people,color: Colors.deepPurple,),
                                  title: Text('Total Users'),
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TotalUsers()));

                                  },
                                ),
                                SizedBox(height: 5,),
                                ListTile(
                                  leading: Icon(Icons.create,color: Colors.deepPurple,),
                                  title: Text('Create Activity'),
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateActivityPage()));
                                  },
                                ),
                                SizedBox(height: 5,),
                                ListTile(
                                  leading: Icon(Icons.school,color: Colors.deepPurple,),
                                  title: Text('Add Educator'),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>   CreateEducatorView()),
                                    );
                                  },
                                ),
                                SizedBox(height: 5,),
                                ListTile(
                                  leading: Icon(Icons.local_laundry_service_outlined,color: Colors.deepPurple,),
                                  title: Text('Add Services'),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>   CreateServicesPage()),
                                    );
                                  },
                                ),
                                SizedBox(height: 5,),
                                ListTile(
                                  leading: Icon(Icons.sports_handball,color: Colors.deepPurple,),
                                  title: Text('Create Equipments'),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>   CreateEquipmentPage()),
                                    );
                                  },
                                ),
                                SizedBox(height: 5,),
                                ListTile(
                                  leading: Icon(Icons.settings,color: Colors.deepPurple,),
                                  title: Text('Edit Profile'),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>   GymOwnerEditProfile()),
                                    );
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
                              leading: Icon(Icons.exit_to_app,color: Colors.deepPurple,),
                              title: Text('Logout'),
                              onTap: () {
                                Navigator.pop(context);
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
                          _buildProfileHeader(context),
                          _buildHighlightSection(context),
                          _buildSelectedSection(context), // Extracted method for selected section
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
                  Text(detailGymViewModel.activityList.length.toString(), style: TextStyle(fontSize: 18)),
                  Text('Activity', style: TextStyle(fontSize: 18)),
                ],
              ),
              Column(
                children: [
                  Text(detailGymViewModel.educatorList.length.toString(), style: TextStyle(fontSize: 18)),
                  Text('Educators', style: TextStyle(fontSize: 18)),
                ],
              ),
              Column(
                children: [
                  Text(detailGymViewModel.gym.capacity, style: TextStyle(fontSize: 18)),
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
            _buildIconButton(Icons.local_laundry_service_outlined, 'Services', 2),
            _buildIconButton(Icons.sports_handball, 'Equipments', 3),
          ],
        )


        // Rest of your page content goes here
      ]),
    );
  }

  Widget _buildIconButton(IconData icon, String label, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          icon: Icon(
            icon,
            color: _selectedIndex == index ? Colors.deepPurple : Colors.black54,
          ),
        ),
        Container(
          height: 2,
          width: 30,
          color: _selectedIndex == index ? Colors.deepPurple : Colors.transparent,
        ),
        Text(
          label, // Burada metin etiketini kullanıyoruz.
          style: TextStyle(
            color: _selectedIndex == index ? Colors.deepPurple : Colors.black54,
          ),
        )
      ],
    );
  }

  Widget _buildPostSection(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: detailGymViewModel.activityList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          var activity =detailGymViewModel.activityList[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailScreenPosts(
                    items:detailGymViewModel.activityList
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

  Widget _buildEducatorSection(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: detailGymViewModel.educatorList.length,
        itemBuilder: (context, index) {
          var educator = detailGymViewModel.educatorList[index];
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
}