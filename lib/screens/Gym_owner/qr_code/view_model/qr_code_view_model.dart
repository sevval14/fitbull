import '../model/qr_data.dart';

class QRDataService {
  QRData? qrData;

  void saveQRData(String scannedData) {
    List<String> parts = scannedData.split(',');
    if (parts.length == 2) {
      qrData = QRData(userId: parts[0], gymId: parts[1]);
    } else {
      throw Exception('Invalid QR Data');
    }
  }

  QRData? getQRData() {
    return qrData;
  }
}
