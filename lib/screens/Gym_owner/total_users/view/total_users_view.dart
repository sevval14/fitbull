import 'package:fitbull/screens/Gym_owner/total_users/view_model/total_users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class TotalUsers extends StatefulWidget {
  @override
  State<TotalUsers> createState() => _TotalUsersState();
}

class _TotalUsersState extends State<TotalUsers> {
  TotalUserViewModel totalUserViewModel = TotalUserViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total Users'),
      ),
      body: FutureBuilder(
        future: totalUserViewModel.gymAllUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: totalUserViewModel.gymAllUsers.length,
              itemBuilder: (context, index) {
                var gymEntry = totalUserViewModel.gymAllUsers[index];
                var user = totalUserViewModel.userList[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://images.unsplash.com/photo-1597466765990-64ad1c35dafc"),
                  ),
                  title: Text(user.username),
                  subtitle: Text(DateFormat('dd/MM/yyyy').format(gymEntry.entryTime)),
                  trailing: IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: () async {
                      var url = 'tel:${384798}';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        print('Could not launch $url');
                      }              },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
