import 'package:fitbull/screens/Gym_owner/create_gym/viewModel/create_gym_view_model.dart';
import 'package:fitbull/screens/login/view/login_view.dart';
import 'package:flutter/material.dart';


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
      createGymViewModel.setName(_nameController.text);
      createGymViewModel.setLocation(_locationController.text);
      createGymViewModel.setImagePath(_imagePathController.text);
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
        title: Text('Create Your Gym'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Please enter your information to continue',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
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
                decoration: InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter image URL';
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
              TextFormField(
                controller: _startHourController,
                decoration: InputDecoration(labelText: 'Start Hour'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter start hour';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _endHourController,
                decoration: InputDecoration(labelText: 'End Hour'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter end hour';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _taxNumberController,
                decoration: InputDecoration(labelText: 'Tax Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter tax number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _websiteController,
                decoration: InputDecoration(labelText: 'Website (Optional)'),
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
