import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

Future<void> sendEmail(String recipientEmail) async {
  // Configure the SMTP server
  final smtpServer = SmtpServer(
    'smtp.gmail.com',
    port: 587,
    ignoreBadCertificate: true,
    allowInsecure: true,
    username: 'sevvalozekinci85@gmail.com',
    password: 'ASDFasdfs.123',
  );

  // Create the message
  final message = Message()
    ..from = Address('your_email@example.com', 'Your Name or App Name')
    ..recipients.add(recipientEmail)
    ..subject = 'Your Subject'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

  try {
    // Send the email
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    // For the sake of example, we print out the error.
    e.toString().split('\n').forEach((element) => print(element));
  }
}
