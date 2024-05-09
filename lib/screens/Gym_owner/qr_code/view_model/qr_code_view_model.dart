import 'dart:convert';
import '../../../../services/service_path.dart';
import '../model/qr_data.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
part 'qr_code_view_model.g.dart';


final QrCodeViewModel qrCodeViewModel = QrCodeViewModel._internal();

class QrCodeViewModel = _QrCodeViewModelBase  with _$QrCodeViewModel;

abstract class _QrCodeViewModelBase with Store {
  static final QrCodeViewModel _instance=QrCodeViewModel._internal();

  factory _QrCodeViewModelBase()=> _instance;
  _QrCodeViewModelBase._internal();

  @observable
  String qrData ="";

  @observable
  String userId="";

  @observable
  String gymId="";


  @action
  Future<PermissionStatus> _getCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      return result;
    } else {
      return status;
    }
  }

  @action
  Future scan() async {
    qrData = (await scanner.scan())!;

    if (qrData == null) {
      print("data is invalid");
    }else{
      splitData();
    }
  }

  @action
  QRData splitData(){
    List<String> parts = qrData.split(',');
    if (parts.length == 2) {
      var qrCode = QRData(userId: parts[0], gymId: parts[1]);
      userId=qrCode.userId;
      gymId=qrCode.gymId;
      return qrCode;
    } else {
      throw Exception('Invalid QR Data');
    }
  }

  @action
  Future<void> requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
      final result = await Permission.camera.request();
      if (result.isGranted) {
        print('Camera permission granted');
      } else {
        print('Camera permission denied');
      }
    } else {
      print('Camera permission already granted');
    }
  }

  @action
  Future<void> requestGalleryPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {

      final result = await Permission.storage.request();

      if (result.isGranted) {
        print('Gallery permission granted');
      } else {
        print('Gallery permission denied');
        openAppSettings();

      }
    } else {
      print('Gallery permission already granted');
    }
  }


  @action
  Future<int> entryGym()async{
    DateTime now = DateTime.now();
    String formattedDate = now.toIso8601String();
    try {
      var response = await http.post(
        Uri.parse(ServicePath.ENTRY_GYM.path),
        headers: {
          'Content-Type': 'application/json',
        }, body: json.encode({
        'userId': userId,
        "gymId":gymId,
        'entryTime': formattedDate,
      }),
      );
      await Future.delayed(const Duration(seconds: 2));
      return response.statusCode;
    } catch (e) {
      print("Connection error: $e");
      return 0;
    }
  }
}