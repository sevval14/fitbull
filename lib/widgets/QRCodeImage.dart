import 'dart:convert';
import 'package:flutter/material.dart';

class QRCodeImage extends StatelessWidget {
  final String base64String;

  QRCodeImage({required this.base64String});

  @override
  Widget build(BuildContext context) {
    final bytes = base64Decode(base64String);

    return Image.memory(bytes);
  }
}
