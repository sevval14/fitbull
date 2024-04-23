import 'dart:convert';
import 'dart:io';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

Future<void> sendEmail(String recipientEmail,String gymName,String base64QRCode) async {
  final pdf = pw.Document();
  final image = pw.MemoryImage(base64Decode(base64QRCode));

  pdf.addPage(pw.Page(
    build: (pw.Context context) => pw.Center(
      child: pw.Image(image, width: 200, height: 200),
    ),
  ));

  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/qr_code.pdf');
  await file.writeAsBytes(await pdf.save());
  // Configure the SMTP server
  final smtpServer = SmtpServer(
    'smtp.gmail.com',
    port: 465,
    ignoreBadCertificate: true,
    allowInsecure: true,
    username: 'sevvalozekinci865@gmail.com',
    password: 'cmna esox tahh flrd',
    ssl: true,

  );

  // Create the message
  final message = Message()
    ..from = Address('sevvalozekinci865@gmail.com', 'Fitbull')
    ..recipients.add(recipientEmail)
    ..subject = 'Fitbull'
    ..text = 'Welcome $gymName :)))))))'
    ..attachments.add(FileAttachment(File(file.path)));
  ;

  try {
    await send(message, smtpServer);
  } on MailerException catch (e) {
    print('Message not sent.');
    e.toString().split('\n').forEach((element) => print(element));
  }
}

