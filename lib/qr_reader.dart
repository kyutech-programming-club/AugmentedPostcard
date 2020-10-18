import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'media_play.dart';
import 'featureCamera.dart';

import 'package:spajam/record.dart';

import 'record.dart';

class QRscan extends StatefulWidget {
  QRscan({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _QRscanState createState() => _QRscanState();
}

class _QRscanState extends State<QRscan> {
  ScanResult scanResult;
  String base64;
  String id;
  String effectType;
  bool hasInfo = false;

  Future _scan() async {
    try {
      var result = await BarcodeScanner.scan();
      setState(() {
        scanResult = result;
        id = result.rawContent.toString();
      });
      DocumentSnapshot qrData = await FirebaseFirestore.instance.collection('apData').doc(result.rawContent.toString()).get();
      if (qrData.exists) {
        setState(() {
          base64 = qrData.data()['voice'];
          effectType = qrData.data()['effectType'];
          hasInfo = true;
        });
      }
    } on PlatformException catch (e) {
      var result = ScanResult(
        type: ResultType.Error,
        format: BarcodeFormat.unknown,
      );
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result.rawContent = 'カメラへのアクセスが許可されていません!';
        });
      } else {
        result.rawContent = 'エラー: $e';
      }
      setState(() {
        scanResult = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget contentList;
    if (scanResult != null) {
      if (hasInfo) {
        contentList = FlatButton(
          child: Text("音声を再生しますか"),
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => CameraWidget(id: id, base64: base64, effectType: effectType,), //MediaPlay(media: scanResult.rawContent?.toString()),
              ),
            );
          },
        );
      } else {
        contentList = RecordWidget(id: id);
      }
      if (scanResult == null)
        ListTile(
          title: Text("ボタンを押してカメラを起動してください"),
          subtitle: Text("カメラをQRコードに向けてください"),
        );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('QRscan'),
        ),
        body: Container(
          child: contentList,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _scan,
          tooltip: 'Scan',
          child: Icon(Icons.camera),
        ),
      ),
    );
  }
}
