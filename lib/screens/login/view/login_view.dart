import 'package:fitbull/constant/regex_constants.dart';
import 'package:fitbull/screens/Customer/home_splash/view/home_splash_view.dart';
import 'package:fitbull/screens/Gym_owner/gym_owner_home_splash/view/gym_owner_home_splash_view.dart';
import 'package:fitbull/screens/login/viewmodel/gym_owner_login_view_model.dart';
import 'package:fitbull/screens/login/viewmodel/login_view_model.dart';
import 'package:fitbull/screens/register/view/register_view.dart';
import 'package:fitbull/services/response_message.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  List<bool> _selection = [true, false];

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                'FitBull',
                style: TextStyle(
                  color: Colors.deepPurple.shade700,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ToggleButtons(
                color: Colors.deepPurple.shade900,
                isSelected: _selection,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Text('Customer'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
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
                margin:const EdgeInsets.all(24),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child:
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
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
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty ) {
                            return 'Please enter your password';
                          }else if(value.length < 6){
                            return 'Password cannot be less than 6';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () async {
                            if (_selection[0]) {
                              if (_formKey.currentState!.validate())  {
                                loginViewModel.setEmail(emailController.text);
                                loginViewModel.setPassword(passwordController.text);

                                print('Customer Selected');
                                int statusCode = await loginViewModel.loginCustomer();

                                if(context.mounted){
                                  if (statusCode == 200 || statusCode == 201) {
                                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                      content: const Text( "Login successful!"),backgroundColor: Colors.green.shade700,
                                    ));
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  const HomeSplashView()),
                                    );

                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text(handleResponseLogin(statusCode)),
                                    ));
                                  }
                                }
                              }
                            }else{
                              if (_formKey.currentState!.validate())  {
                                gymOwnerLoginViewModel.setEmail(emailController.text);
                                gymOwnerLoginViewModel.setPassword(passwordController.text);
                                print('Gym owner selected');

                                if(context.mounted){
                                  int statusCode = await gymOwnerLoginViewModel.loginGymOwner();

                                  if (statusCode == 200 || statusCode == 201) {
                                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                      content: const Text( "Login successful!"),backgroundColor: Colors.green.shade700,
                                    ));
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  const GymOwnerHomeSplashView()),
                                    );

                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text(handleResponseLogin(statusCode)),
                                    ));
                                  }
                                }
                              }
                            }


                        },
                        child: Text('Login'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.deepPurple.shade400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to RegisterPage
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage()),
                          );

                        },
                        child: Text(
                          "Don't have an account? Register",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                )

              ),
            ],
          ),
        ),
      ),
    );
  }
}
