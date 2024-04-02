import 'package:fitbull/constant/regex_constants.dart';
import 'package:fitbull/screens/home_splash/view/home_splash_view.dart';
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
          child: Container(
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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login to FitBull',
                    style: TextStyle(
                      color: Colors.blueGrey.shade900,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                      // Login logic
                      if (_formKey.currentState!.validate())  {
                        loginViewModel.setEmail(emailController.text);
                        loginViewModel.setPassword(passwordController.text);

                        int statusCode = await loginViewModel.login();

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
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blueGrey.shade800,
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
            ),
          ),
        ),
      ),
    );
  }
}
