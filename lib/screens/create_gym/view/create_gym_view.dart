import 'package:fitbull/screens/create_gym/viewModel/create_gym_view_model.dart';
import 'package:fitbull/services/response_message.dart';
import 'package:flutter/material.dart';

class CreateGymPage extends StatefulWidget {
  @override
  _CreateGymPageState createState() => _CreateGymPageState();
}

class _CreateGymPageState extends State<CreateGymPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _imagePathController = TextEditingController();
  final _capacityController = TextEditingController();
  final CreateGymViewModel createGymViewModel = CreateGymViewModel();

  void _submitForm() async{
    if (_formKey.currentState!.validate()) {
        createGymViewModel.setName(_nameController.text);
        createGymViewModel.setLocation(_locationController.text);
        createGymViewModel.setImagePath(_imagePathController.text);
        createGymViewModel.setCapacity(_capacityController.text);

        int statusCode = await createGymViewModel.createGym();

        if(context.mounted){
          if (statusCode == 200 || statusCode == 201) {
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
              content: const Text( "Gym created successful!"),backgroundColor: Colors.green.shade700,
            ));
          }else if(statusCode==401){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Gym already exists")),
            );
          }
        }


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Gym'),
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
                  decoration: InputDecoration(labelText: 'Gym Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter gym name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(labelText: 'Location'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter location';
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
                TextFormField(
                  controller: _capacityController,
                  decoration: InputDecoration(labelText: 'Capacity'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter capacity';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: _submitForm,
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
