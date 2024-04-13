import 'package:fitbull/constant/regex_constants.dart';
import 'package:fitbull/screens/Gym_owner/create_educator/viewModel/create_educator_view_model.dart';
import 'package:fitbull/screens/Gym_owner/gym_owner_dashboard/view/gym_owner_dashboard_view.dart';
import 'package:fitbull/screens/login/view/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../create_activity/viewModel/create_activity_view_model.dart';


class CreateEducatorView extends StatefulWidget {

  @override
  State<CreateEducatorView> createState() => _CreateEducatorViewState();
}

class _CreateEducatorViewState extends State<CreateEducatorView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _imagePathController = TextEditingController();
  final _branchController = TextEditingController();
  final CreateEducatorViewModel createEducatorViewModel = CreateEducatorViewModel();
  final ImagePicker _picker = ImagePicker();
  final CreateActivityViewModel createActivityViewModel = CreateActivityViewModel();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source:  ImageSource.camera);
    if (image != null) {
      setState(() {
        _imagePathController.text = image.path;
      });
    }
  }


  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _imagePathController.dispose();
    super.dispose();
  }
  void _submitForm(BuildContext context) async{
    if (_formKey.currentState!.validate()) {
      await createActivityViewModel.uploadImage(_imagePathController.text);

      Future.delayed(const Duration(seconds: 10));
      createEducatorViewModel.setName(_nameController.text);
      createEducatorViewModel.setPhoneNumber(_phoneNumberController.text);
      createEducatorViewModel.setImagePath(createActivityViewModel.targetPathImage);
      createEducatorViewModel.setBranch(_branchController.text);


      int statusCode = await createEducatorViewModel.createEducator();

      if(context.mounted){
        if (statusCode == 200 || statusCode == 201) {
          if(context.mounted){
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
              content: const Text( "Educator created successful!"),backgroundColor: Colors.green.shade700,
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



        }else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Educator already exists")),
          );

        }
      }


    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.school, // İkon
                size: 60.0, // İkonun boyutu
                color: Colors.deepPurple[900], // İkonun rengi
              ),
              Text(
                'Create Your Educator',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24, // Metin boyutu
                  fontWeight: FontWeight.w400, // Metin kalınlığı
                  color: Colors.deepPurple[900], // Metin rengi
                ),
              ),
              SizedBox(height: 50),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Educator Name',
                  labelStyle: TextStyle(color: Colors.black87), // Etiket metnine stil verme
                  border: OutlineInputBorder( // Çerçeveyi tanımla
                    borderRadius: BorderRadius.circular(15.0), // Yuvarlak köşeler
                  ),
                  enabledBorder: OutlineInputBorder( // Aktif olmayan durum için çerçeve stilini belirle
                    borderSide: BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder( // Fokuslandığında çerçeve stilini belirle
                    borderSide: BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter educator name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: Colors.black87),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty ) {
                    return 'Please enter phone number';
                  }else if(!RegExp(rPhoneNumber).hasMatch(value)){
                    return 'Please enter valid phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              // Branch
              TextFormField(
                controller: _branchController,
                decoration: InputDecoration(
                  labelText: 'Branch',
                  labelStyle: TextStyle(color: Colors.black87),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter branch';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Image URL
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

              SizedBox(height: 10),
              ElevatedButton(
                onPressed: (){
                  _submitForm(context);
                },
                child: Text('Submit',style: TextStyle(
                  color: Colors.deepPurple[900], // Metin rengi
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


