import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QR extends StatelessWidget { // <- (※1)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR"), // <- (※2)
      ),
      body: Center(
          child: QrImage(
            data: 'Enter code here',
            size: 200,
            embeddedImage: AssetImage('images/twitter.png'),
            embeddedImageStyle: QrEmbeddedImageStyle(
              size: Size(50, 50),
            ),
          ) // <- (※3)
      ),
    );
  }
}