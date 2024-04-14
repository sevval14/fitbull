import 'package:fitbull/screens/Customer/detail_gym/view_model/detail_gym_view_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../widgets/gym_properties.dart';
import '../../../../widgets/sending_mail.dart';
import '../../../Gym_owner/create_gym/model/create_gym_model.dart';
import '../../../login/viewmodel/login_view_model.dart';

class DetailGymView extends StatefulWidget {
  final int id;

  DetailGymView({required this.id});

  @override
  _DetailGymViewState createState() => _DetailGymViewState();
}

class _DetailGymViewState extends State<DetailGymView> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    detailGymViewModel.fetchGym(widget.id);
    detailGymViewModel.fetchService(widget.id);
    detailGymViewModel.fetchEquipment(widget.id);
    detailGymViewModel.fetchActivity(widget.id);
    detailGymViewModel.fetchEducator(widget.id);
  }

  @override
  void dispose() {
    detailGymViewModel.fetchGym(widget.id);
    detailGymViewModel.fetchService(widget.id);
    detailGymViewModel.fetchEquipment(widget.id);
    detailGymViewModel.fetchActivity(widget.id);
    detailGymViewModel.fetchEducator(widget.id);



    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: detailGymViewModel.fetchGym(widget.id), // Assuming this is a Future that fetches gym details
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show loading spinner while waiting
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Show error if something went wrong
          } else {
            // Once the data is fetched, you can display your widgets
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/home/macFit.png'), // Replace with actual path to gym image
                  SizedBox(height: 8),
                  Text(snapshot.data.name, // Assuming the gym details are in this data structure
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star,color: Colors.yellow,),
                      Text('4.8 (21 Reviews)', style: TextStyle(fontSize: 18, color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height:10),
                  DefaultTabController(
                    length: 5,
                    child: Column(
                      children: <Widget>[
                        const TabBar(
                          automaticIndicatorColorAdjustment: true,
                          tabs: [
                            Tab(text: 'About'),
                            Tab(text: 'Activities'),
                            Tab(text: 'Educators'),
                            Tab(text: 'Services'),
                            Tab(text: 'Equipment'),
                          ],
                        ),
                        Container(
                          height: 500, // Arbitrary height for the tab content
                          child: Center(
                            child: TabBarView(
                              children: <Widget>[
                                buildAboutSection(context, snapshot.data),
                                Center(child: buildActivity(context)),
                                Center(child: buildEducatorSection(context,false)),
                                buildService(context),
                                Center(child: buildEquipmentsSection(context)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }


  Widget buildAboutSection(BuildContext context, Gym data)  {
    // Assuming GymData is your data model which holds all the details for the gym.
    return Column(
      children: [
        SizedBox(height: 30,),
        Wrap(
          spacing: 8.0, // Spacing between the cards horizontally
          runSpacing: 8.0, // Spacing between the cards vertically
          children: [
            infoCard(context, Icons.attach_money, "Price", '9 per month'),
            infoCard(context, Icons.access_time, "Open", '${data.startHour} - ${data.endHour}'),
            infoCard(context, Icons.location_on, "Location", '${data.location}'),
            infoCard(context, Icons.webhook_outlined, "Web Site", '${data.webSite}'),
            // Add more cards as needed
          ],
        ),
        SizedBox(height: 30,),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                final _formKey = GlobalKey<FormState>();
                TextEditingController emailController = TextEditingController();
                emailController.text=loginViewModel.email;
                return AlertDialog(
                  title: Text("${detailGymViewModel.gym.name} Register"),
                  content: SingleChildScrollView( // Allows the AlertDialog to scroll
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Takes up minimum space
                      children: [
                        Text(
                          'Are you sure you want to join this gym? After you register to the gym, we will send you an informative email.',
                        ),
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an email';
                              }
                              // Add more complex email validation if needed
                              return null;
                            },
                            onSaved: (value) {
                              loginViewModel.email = value ?? '';
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () => Navigator.of(context).pop(), // Close the dialog
                    ),
                    TextButton(
                      child: Text('Submit'),
                      onPressed: ()async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          await sendEmail(loginViewModel.email);

                          Navigator.of(context).pop();

                          // Optionally show a confirmation message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Email sent to ${loginViewModel.email}')),
                          );                        }
                      },

                    ),
                  ],
                );
              },
            );
          },
          child: Text(
            "Register",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurple,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          ),
        )

      ],
    );
  }

}


