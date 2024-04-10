import 'package:fitbull/screens/Gym_owner/create_educator/viewModel/create_educator_view_model.dart';
import 'package:fitbull/screens/login/view/login_view.dart';
import 'package:flutter/material.dart';


class CreateEducatorView extends StatefulWidget {
  const CreateEducatorView({Key? key}) : super(key: key);

  @override
  State<CreateEducatorView> createState() => _CreateEducatorViewState();
}

class _CreateEducatorViewState extends State<CreateEducatorView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _imagePathController = TextEditingController();
  final CreateEducatorViewModel createEducatorViewModel = CreateEducatorViewModel();


  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _imagePathController.dispose();
    super.dispose();
  }
  void _submitForm() async{
    if (_formKey.currentState!.validate()) {
      createEducatorViewModel.setName(_nameController.text);
      createEducatorViewModel.setPhoneNumber(_phoneNumberController.text);
      createEducatorViewModel.setImagePath(_imagePathController.text);

      int statusCode = await createEducatorViewModel.createEducator();

      if(context.mounted){
        if (statusCode == 200 || statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            content: const Text( "Educator created successful!"),backgroundColor: Colors.green.shade700,
          ));


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
        title: Text('Create Your Educator'),
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
                decoration: InputDecoration(labelText: 'Educator Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter educator name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
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


