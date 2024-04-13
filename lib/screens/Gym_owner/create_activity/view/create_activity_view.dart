import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constant/regex_constants.dart';
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
      await createActivityViewModel.uploadImage(_imagePathController.text);

      Future.delayed(Duration(seconds: 10));
      createActivityViewModel.setName(_nameController.text);
      createActivityViewModel.setImagePath(createActivityViewModel.targetPathImage);
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
            Navigator.pop(context);
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: <Widget>[
                Icon(
                  Icons.fitness_center_outlined,
                  size: 60.0,
                  color: Colors.deepPurple[900],
                ),
                Text(
                  'Create Your Activity',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.deepPurple[900],
                  ),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Activity Name',
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
                    if (value == null || value.isEmpty ) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
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
                      return 'Please enter description';
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

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: (){
                      _submitForm(context);
                    },
                    child: const Text('Submit'),
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
