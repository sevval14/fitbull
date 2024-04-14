import 'package:fitbull/screens/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/Customer/detail_gym/view_model/detail_gym_view_model.dart';
import '../screens/Gym_owner/create_gym/model/create_gym_model.dart';
Widget buildEducatorSection(BuildContext context, bool showPhone) {
  if (detailGymViewModel.educatorList.isEmpty) {
    return Center(
      child: Text(
        "There is no educator in this gym",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }
  // Removed Expanded, assuming this widget is not the child of a Column or Row
  return ListView.builder(
    itemCount: detailGymViewModel.educatorList.length,
    itemBuilder: (context, index) {
      var educator = detailGymViewModel.educatorList[index];
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/home/teacher.png"),
        ),
        title: Text(educator.name),
        subtitle: Text(educator.branch),
        trailing: showPhone
            ? IconButton(
          icon: Icon(Icons.phone),
          onPressed: () async {
            var url = 'tel:${educator.phoneNumber}';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Could not launch $url')),
              );
              // Or handle the error in a way appropriate for your app
            }
          },
        )
            : SizedBox(),
      );
    },
  );
}


Widget infoCard(BuildContext context, IconData icon, String title, String subtitle) {
  return Card(
    elevation: 4.0,
    child: Container(
      width: (MediaQuery.of(context).size.width - 40) / 2, // Calculate the width dynamically
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Use the minimum space
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Theme.of(context).primaryColor),
              SizedBox(width: 8.0),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 8.0),
          Text(subtitle),
        ],
      ),
    ),
  );
}

Widget _buildServiceIcon(BuildContext context, IconData icon, String label) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.deepPurple.shade100, // Adjust the color to match the one in your image
          child: Icon(icon, size: 30, color: Colors.deepPurple.shade600), // Adjust the icon size and color as needed
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(label, style: TextStyle(color: Colors.deepPurple.shade600)), // Adjust the text color to match your design
        ),
      ],
    ),
  );
}

Widget buildService(BuildContext context) {
  if(detailGymViewModel.serviceList.length==0){
    return Text("There is no service in this gym",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),);
  }
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Wrap(
      alignment: WrapAlignment.start,
      spacing: 20.0, // space between columns
      runSpacing: 20.0, // space between rows
      children: List<Widget>.generate(
        detailGymViewModel.serviceList.length, // Assuming this is the number of services
            (index) => _buildServiceIcon(
          context,
          Icons.directions_bike, // Here you should replace with an icon based on your service type
          detailGymViewModel.serviceList[index].name,
        ),
      ),
    ),
  );
}

Widget buildEquipmentsSection(BuildContext context) {
  if(detailGymViewModel.equipmentList.length==0){
    return Text("There is no equipment in this gym",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),);
  }
  return Expanded(
    child: ListView.builder(
      itemCount: detailGymViewModel.equipmentList.length,
      itemBuilder: (context, index) {
        var equipment = detailGymViewModel.equipmentList[index];
        return ListTile(
          leading: Icon(Icons.device_hub_sharp,color: Colors.deepPurple,), // Replace with the desired icon
          title: Text(equipment.name),
        );
      },
    ),
  );
}


Widget _activityCard({
  required String imageUrl,
  required String name,
  required String description,
  required int? price, // Assuming price can be null and is an integer
}) {
  String priceText = price == null || price == 0 ? 'Free' : '$price TL';

  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              imageUrl,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.event, color: Colors.grey),
                Text(
                  priceText,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildActivity(BuildContext context) {
  if(detailGymViewModel.activityList.length==0){
    return Text("There is no activity in this gym",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),);
  }
  return ListView.builder(
    itemCount: detailGymViewModel.activityList.length,
    itemBuilder: (context, index) {
      var activity = detailGymViewModel.activityList[index];
      return _activityCard(
        imageUrl: "assets/home/competition.png",//TODO image
        name: activity.name,
        description: activity.description,
        price: 0,
      );
    },
  );
}

