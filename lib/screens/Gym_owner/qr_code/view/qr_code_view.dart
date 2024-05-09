import 'dart:io';
import 'package:fitbull/screens/Gym_owner/qr_code/view_model/qr_code_view_model.dart';
import 'package:fitbull/screens/login/viewmodel/gym_owner_login_view_model.dart';
import 'package:fitbull/screens/login/viewmodel/login_view_model.dart';
import 'package:fitbull/screens/register/viewmodel/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../gym_owner_dashboard/view/gym_owner_dashboard_view.dart';


class QRCodeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRCodeViewState();
}

class _QRCodeViewState extends State<QRCodeView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initState() {
    loginViewModel.allUsers();

    super.initState();
  }
  @override
  void dispose() {
    qrCodeViewModel.userId = "";
    qrCodeViewModel.gymId = "";
    qrCodeViewModel.qrData = "";
    loginViewModel.findUser.entryId=0;
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(loginViewModel.findUser.entryId == 0 ?"Please scan qr code" :loginViewModel.userName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(height: 20,),
                  Container(
                    height: 250,
                    width: 250,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () async{
                        await qrCodeViewModel.requestCameraPermission();
                        await qrCodeViewModel.requestGalleryPermission();
                        await qrCodeViewModel.scan();
                        await loginViewModel.findName(qrCodeViewModel.userId);

                        setState(() {
                        });                      },
                      child: Image.asset("assets/home/QR_camera.png",height: 250,width: 250,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () async {
                if(qrCodeViewModel.gymId!=gymOwnerLoginViewModel.gymOwnerGymId.toString()){
                  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                    content: const Text( "Please scan qr code,gym is not"),backgroundColor: Colors.red.shade700,
                  ));
                }else{
                  int statusCode = await qrCodeViewModel.entryGym();
                  if (statusCode == 200 || statusCode == 201) {
                    if(context.mounted){
                      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                        content: const Text( "Created successful!"),backgroundColor: Colors.green.shade700,
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
                        content: Text("This user already has an entry.")),
                    );

                  }
                }
              },
              child: Text("Register to gym"),
            ),
          )
        ],
      ),
    );
  }





}