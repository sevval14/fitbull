import 'package:fitbull/screens/Gym_owner/create_gym/viewModel/create_gym_view_model.dart';
import 'package:fitbull/screens/login/view/login_view.dart';
import 'package:flutter/material.dart';

import '../../create_activity/viewModel/create_activity_view_model.dart';


class CreateGymApp extends StatefulWidget {
  @override
  State<CreateGymApp> createState() => _CreateGymAppState();
}

class _CreateGymAppState extends State<CreateGymApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Your Gym',
      home: CreateGymPage(),
    );
  }
}

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
  final _startHourController = TextEditingController();
  final _endHourController = TextEditingController();
  final _taxNumberController = TextEditingController();
  final _websiteController = TextEditingController();
  final CreateActivityViewModel createActivityViewModel = CreateActivityViewModel();

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _imagePathController.dispose();
    _capacityController.dispose();
    _startHourController.dispose();
    _endHourController.dispose();
    _taxNumberController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  void _submitForm() async{
    if (_formKey.currentState!.validate()) {
      await createActivityViewModel.uploadImage(_imagePathController.text);
      Future.delayed(Duration(seconds: 10));

      createGymViewModel.setName(_nameController.text);
      createGymViewModel.setLocation(_locationController.text);
      createGymViewModel.setImagePath(createActivityViewModel.targetPathImage);
      createGymViewModel.setCapacity(_capacityController.text);
      createGymViewModel.setStartHour(_startHourController.text);
      createGymViewModel.setEndHour(_endHourController.text);
      createGymViewModel.setTaxNumber(_taxNumberController.text);
      createGymViewModel.setWebSite(_websiteController.text);


      int statusCode = await createGymViewModel.createGym();

      if(context.mounted){
        if (statusCode == 200 || statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            content: const Text( "Gym created successful!"),backgroundColor: Colors.green.shade700,
          ));
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>   LoginPage()),
          );


        }else {
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
        title:   Text(
          'Create Your Activity',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Gym Name',
                  labelStyle: const TextStyle(color: Colors.black87),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter gym name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(
                  labelText: 'Location',
                  labelStyle: const TextStyle(color: Colors.black87),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _capacityController,
                decoration: InputDecoration(
                  labelText: 'Capacity',
                  labelStyle: const TextStyle(color: Colors.black87),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter capacity';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: (){
                  createActivityViewModel.pickImage(_imagePathController);},
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _imagePathController,
                    decoration: InputDecoration(
                      labelText: 'Select Image',
                      labelStyle: const TextStyle(color: Colors.black87),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black54, width :2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.photo_library),
                        onPressed: (){
                          createActivityViewModel.pickImage(_imagePathController);
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter image URL';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _startHourController,
                decoration: InputDecoration(
                  labelText: 'Start Hour',
                  labelStyle: const TextStyle(color: Colors.black87),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter start hour';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _endHourController,
                decoration: InputDecoration(
                  labelText: 'End Hour',
                  labelStyle: const TextStyle(color: Colors.black87),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter end hour';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _taxNumberController,
                decoration: InputDecoration(
                  labelText: 'Tax Number',
                  labelStyle: const TextStyle(color: Colors.black87),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter tax number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              TextFormField(
                controller: _websiteController,
                decoration: InputDecoration(
                  labelText: 'Website (Optional)',
                  labelStyle: const TextStyle(color: Colors.black87),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
