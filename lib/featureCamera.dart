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
    CameraController controller;
    controller = new CameraController(cameras[0], ResolutionPreset.ultraHigh);
    await controller.initialize();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          title: Text("AugmentedPostcard"),
        ),
        body: CameraPreview(cameraController)
    );
    // Center(
    //
    //   child: Column(
    //
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       Text(
    //         '',
    //       ),
    //       RaisedButton(
    //         child: Text("情報なし"),
    //         onPressed: () {
    //           Navigator.pushNamed(context, 'record_root');
    //         },
    //         highlightElevation: 16.0,
    //         highlightColor: Colors.blue,
    //         onHighlightChanged: (value) {},
    //       ),
    //       RaisedButton(
    //         child: Text("情報あり"),
    //         onPressed: () {},
    //         highlightElevation: 16.0,
    //         highlightColor: Colors.blue,
    //         onHighlightChanged: (value) {},
    //       ),
    //     ],
    //   ),
    // ),
    // );
  }
}