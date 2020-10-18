import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class RecordWidget extends StatefulWidget {
  RecordWidget({Key key, this.id}) : super(key: key);

  final id;

  @override
  _RecordWidgetState createState() => _RecordWidgetState();
}

class _RecordWidgetState extends State<RecordWidget> {
  bool is_ok = false;

  bool initialized = false;
  FlutterAudioRecorder recorder;

  Future<bool> initializeRecorder () async {
    if (initialized) {
      return Future.value(true);
    }
    bool hasPermission = await FlutterAudioRecorder.hasPermissions;
    print(hasPermission);
    if (hasPermission) {
      final dir = await getApplicationDocumentsDirectory();
      recorder = FlutterAudioRecorder("${dir.path}/voice.aac", audioFormat: AudioFormat.AAC);
      await recorder.initialized;
      print("success");
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: initializeRecorder(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          Container(color:Colors.blue);
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Start'),
                  onPressed: () async {
                    await recorder.start();
                  },
                ),
                RaisedButton(
                  child: Text('Stop'),
                  onPressed: () async {
                    await recorder.stop();
                    setState(() {
                      initialized = true;
                      is_ok = true;
                    });
                  },
                ),
                Row(children: <Widget>[
                  Expanded(child: (is_ok) ? RaisedButton(
                    child: Text("再生"),
                    onPressed: () async {
                      //再生
                      var recordData = await recorder.stop();
                      AudioPlayer audioPlayer = AudioPlayer();
                      await audioPlayer.play(recordData.path, isLocal: true);
                    },
                    highlightElevation: 16.0,
                    highlightColor: Colors.blue,
                    onHighlightChanged: (value) {},
                  ) : Container(),),
                  Expanded(child: (is_ok) ? RaisedButton(
                    child: Text("取り消し"),
                    onPressed: () async {
                      //取り消しq
                      var recordData = await recorder.stop();
                      await File(recordData.path).delete();
                      setState(() {
                        initialized = false;
                        is_ok = false;
                      });
                    },
                    highlightElevation: 16.0,
                    highlightColor: Colors.blue,
                    onHighlightChanged: (value) {},
                  ) : Container(),),
                ]),
                (is_ok) ? RaisedButton(
                  child: Text("登録"),
                  onPressed: () async {
                    //音声をデータベースに入れて、メモリから消す
                    var recordData = await recorder.stop();
                    print(recordData.runtimeType);

                    DocumentReference apRec = FirebaseFirestore.instance.collection('apRec').doc(widget.id);
                    await apRec.set({
                      'voice': await makeBase64(recordData.path),
                    })
                        .then((value) => print("apRec Added"))
                        .catchError((error) => print("Failed to add apRec: $error"));

                    await File(recordData.path).delete();
                  },
                  highlightElevation: 16.0,
                  highlightColor: Colors.blue,
                  onHighlightChanged: (value) {},
                ) : Text('音声を入力してください'),
              ],
            ),
          );
        }
        return Container(color: Colors.red,);
      },
    );
  }
}

Future<String> makeBase64(String path) async {
  try {
    final file = File(path);
    file.openRead();

    List<int> fileBytes = await file.readAsBytes();
    String base64String = base64.encode(fileBytes);

    return base64String;
  } catch (e) {
    print(e.toString());
    return null;
  }
}
