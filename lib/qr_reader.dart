import 'dart:async';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'media_play.dart';

import 'main.dart';

class QRscan extends StatefulWidget {
  QRscan({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _QRscanState createState() => _QRscanState();
}

class _QRscanState extends State<QRscan> {
  ScanResult scanResult;

  Future _scan() async {
    try {
      var result = await BarcodeScanner.scan();
      setState(() => scanResult = result);
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
    var contentList = <Widget>[
      if (scanResult != null)
        FlatButton(
          child: Text("音声を再生しますか"),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute<Null>(
                settings: const RouteSettings(name: "media_play"),
            builder: (BuildContext context) => MediaPlay(media: scanResult.rawContent?.toString()),
            ),);
          },
        ),
      if (scanResult == null)
        ListTile(
          title: Text("ボタンを押してカメラを起動してください"),
          subtitle: Text("カメラをQRコードに向けてください")),
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('QRscan'),
          ),
          body: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: contentList,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _scan,
            tooltip: 'Scan',
            child: Icon(Icons.camera),
          ),
        ));
  }
}
