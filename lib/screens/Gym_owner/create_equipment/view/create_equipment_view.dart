import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constant/regex_constants.dart';
import '../../gym_owner_dashboard/view/gym_owner_dashboard_view.dart';
import '../viewModel/create_equipment_view_model.dart';

class CreateEquipmentPage extends StatefulWidget {
  @override
  _CreateEquipmentPageState createState() => _CreateEquipmentPageState();
}

class _CreateEquipmentPageState extends State<CreateEquipmentPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final CreateEquipmentViewModel createEquipmentViewModel = CreateEquipmentViewModel();

  void _submitForm(BuildContext context) async{
    if (_formKey.currentState!.validate()) {

      Future.delayed(Duration(seconds: 10));
      createEquipmentViewModel.setName(_nameController.text);
      int statusCode = await createEquipmentViewModel.createEquipment();

        if (statusCode == 200 || statusCode == 201) {
          if(context.mounted){
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
              content: const Text( "Equipment created successful!"),backgroundColor: Colors.green.shade700,
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
              content: Text("Equipment already exists")),
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
                  Icons.sports_handball,
                  size: 60.0,
                  color: Colors.deepPurple[900],
                ),
                Text(
                  'Create Your Equipment',
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
                    labelText: 'Equipment Name',
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
