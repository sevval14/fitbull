import 'package:flutter/material.dart';

import '../../gym_owner_dashboard/view/gym_owner_dashboard_view.dart';
import '../viewModel/create_activity_view_model.dart';

class CreateActivityPage extends StatefulWidget {
  @override
  _CreateActivityPageState createState() => _CreateActivityPageState();
}

class _CreateActivityPageState extends State<CreateActivityPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _imagePathController = TextEditingController();
  final _descriptionController = TextEditingController();
  final CreateActivityViewModel createActivityViewModel = CreateActivityViewModel();

  void _submitForm(BuildContext context) async{
    if (_formKey.currentState!.validate()) {
      createActivityViewModel.setName(_nameController.text);
      createActivityViewModel.setImagePath(_imagePathController.text);
      createActivityViewModel.setLocation(_descriptionController.text);

      int statusCode = await createActivityViewModel.createActivity();


        if (statusCode == 200 || statusCode == 201) {
          if(context.mounted){
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
              content: const Text( "Activity created successful!"),backgroundColor: Colors.green.shade700,
            ));
          }

          await Future.delayed(const Duration(seconds: 2));
          if(context.mounted){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  GymOwnerDashboard()),
            );
          }


        }else if(statusCode==401){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Activity already exists")),
          );

        }


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Activity'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Activity Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter activity name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter description';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _imagePathController,
                  decoration: InputDecoration(labelText: 'Image Path'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter image path';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: (){
                      _submitForm(context);
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
