import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:io';
import 'dart:convert';

import 'package:flare_flutter/flare_actor.dart';

class CameraWidget extends StatefulWidget {
  CameraWidget({Key key, this.id, this.base64, this.effectType}) : super(key: key);

  final String id;
  final String base64;
  final String effectType;

  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {

  CameraController cameraController;

  Future<void> loadData() async {
    WidgetsFlutterBinding.ensureInitialized();
    List<CameraDescription> cameras;
    try {
      AudioPlayer audioPlayer = AudioPlayer();
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/audio.mp3');
      await file.writeAsBytes(base64Decode(widget.base64));
      await audioPlayer.play(file.path, isLocal: true);
      cameras = await availableCameras();
    } on CameraException catch (e) {
      print(e);
    }
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    await cameraController.initialize();
    return true;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("AugmentedPostcard"),
      ),
      body: FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(color: Colors.red,);
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
                children: <Widget> [
                  CameraPreview(cameraController),
                  Positioned(
                    top: 320.0,
                    left: 0,
                    width: 420.0,
                    height: 420.0,
                    child: FlareActor(
                        "assets/Summer2.flr",
                        animation: "Untitled",
                        alignment:Alignment.center,
                        fit: BoxFit.contain,
                        snapToEnd:true // これがあると滑らか
                    ),
                  ),
                ]);
          }
          return Container(color: Colors.white,);
        },
      ),
    );
  }
}