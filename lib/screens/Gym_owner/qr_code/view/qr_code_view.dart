/*
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../model/qr_data.dart';
import '../view_model/qr_code_view_model.dart';

class QRCodeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRCodeViewState();
}

class _QRCodeViewState extends State<QRCodeView> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  File? _image;
  final ImagePicker _picker = ImagePicker();
  String? qrCodeResult;
  String? _data = '';
  String _decoded = 'Unknown';

 */
/* Future<void> _startQRScan() async {
      var imagePicker = ImagePicker();

      XFile? xfile = await imagePicker.pickImage(source: ImageSource.gallery);

      if (xfile != null) {
        String? decoded;
        // Platform messages may fail, so we use a try/catch PlatformException.
        // We also handle the message potentially returning null.
        try {
          decoded = await QrCodeUtilsAndroid.decodeFrom(xfile.path) ??
              'Unknown platform version';
          if (decoded != null) {
            _decoded = decoded;
          }
          print(decoded);
          print("sevval");
        } on PlatformException {
          _decoded = 'Failed to get decoded.';
        }
      }

      // If the widget was removed from the tree while the asynchronous platform
      // message was in flight, we want to discard the reply rather than calling
      // setState to update our non-existent appearance.
      if (!mounted) return;

      setState(() {
        // _platformVersion = platformVersion;
      });
    } *//*

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  void _takeOrData() async {
    String scannedQRData = '12345,67890'; // Bu değer QR kod okuyucudan gelecek
    try {
      QRDataService qrService = QRDataService();
      qrService.saveQRData(scannedQRData);
      QRData? data = qrService.getQRData();
      print('User ID: ${data?.userId}, Gym ID: ${data?.gymId}');
    } catch (e) {
      print('Error reading QR data: $e');
    }
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
              child: Container(
                height: 250,
                width: 250,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    //_startQRScan();
                  },
                  child: Image.asset("assets/home/QR_camera.png",height: 250,width: 250,),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
              },
              child: Text("Register to gym"),
            ),
          )
        ],
      ),
    );
  }


  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // QR kod okuma işlemleri
    });
  }



}

*/
