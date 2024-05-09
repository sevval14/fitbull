import 'package:fitbull/constant/regex_constants.dart';
import 'package:fitbull/screens/Gym_owner/create_gym/view/create_gym_view.dart';
import 'package:fitbull/screens/Gym_owner/gym_owner_home_splash/view/gym_owner_home_splash_view.dart';
import 'package:fitbull/screens/login/view/login_view.dart';
import 'package:fitbull/screens/register/viewmodel/gym_owner_register_view_model.dart';
import 'package:fitbull/screens/register/viewmodel/register_view_model.dart';
import 'package:fitbull/services/response_message.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();


}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  List<bool> _selection = [true, false];

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Register',
                style: TextStyle(
                  color: Colors.deepPurple.shade700,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ToggleButtons(
                color: Colors.deepPurple,
                isSelected: _selection,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    child: Text('Customer'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    child: Text('Gym Owner'),
                  ),

                ],
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < _selection.length; i++) {
                      _selection[i] = i == index;
                    }

                  });
                },


              ),
              Container(
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset:const Offset(0, 3),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue.shade900),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue.shade900),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }else if(!RegExp(rEmailRegex).hasMatch(value)){
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue.shade900),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty ) {
                            return 'Please enter your password';
                          }else if(value.length < 6 ){
                            return "Cannot be shorter than 6 letters";
                          }else if(RegExp(rPasswordRegex).hasMatch(value)==false){
                            return "Please enter a valid password";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () async {


                            if (_selection[0]) {
                              if (_formKey.currentState!.validate()) {
                                registerViewModel.setUsername(usernameController.text);
                                registerViewModel.setEmail(emailController.text);
                                registerViewModel.setPassword(passwordController.text);
                                print("Customer selected");
                                int statusCode = await registerViewModel.registerUser();

                                if(context.mounted){
                                  if (statusCode == 200 || statusCode == 201) {
                                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                      content: const Text( "Registration successful!"),backgroundColor: Colors.green.shade700,
                                    ));

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  LoginPage()),
                                    );

                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text(handleResponseRegister(statusCode)),
                                    ));
                                  }
                                }
                              }

                            }else{
                              if (_formKey.currentState!.validate()) {
                                gymOwnerRegisterViewModel.setUsername(usernameController.text);
                                gymOwnerRegisterViewModel.setEmail(emailController.text);
                                gymOwnerRegisterViewModel.setPassword(passwordController.text);

                                print("GymOwner selected");
                                int statusCode = await gymOwnerRegisterViewModel.registerGymOwner();

                                if(context.mounted){
                                  if (statusCode == 200 || statusCode == 201) {
                                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                      content: const Text( "Registration successful!"),backgroundColor: Colors.green.shade700,
                                    ));
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>   CreateGymPage()),
                                    );

                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text(handleResponseRegister(statusCode)),
                                    ));
                                  }
                                }
                              }

                            }




                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(onPressed: (){
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) =>  LoginPage()),
                            );

                          }, child: const Text("Sign in"))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
