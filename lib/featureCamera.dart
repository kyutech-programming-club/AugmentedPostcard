import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

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
            return CameraPreview(cameraController);
          }
          return Container(color: Colors.white,);
        },
      ),
    );
  }
}