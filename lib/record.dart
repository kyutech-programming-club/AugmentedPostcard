import 'package:flutter/material.dart';

class RecordWidget extends StatefulWidget {
  RecordWidget({Key key}) : super(key: key);

  @override
  _RecordWidgetState createState() => _RecordWidgetState();
}

class _RecordWidgetState extends State<RecordWidget> {
  bool is_ok = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("AugmentedPostcard"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '',
            ),
            IconButton(
              color: Colors.blue,
              iconSize: 100,
              icon: Icon(Icons.keyboard_voice_outlined),
              onPressed: () {
                setState(() {
                  is_ok = true;
                });
              },
            ),
            Row(children: <Widget>[
              Expanded(child: (is_ok) ? RaisedButton(
                child: Text("再生"),
                onPressed: () {},
                highlightElevation: 16.0,
                highlightColor: Colors.blue,
                onHighlightChanged: (value) {},
              ) : Container(),),
              Expanded(child: (is_ok) ? RaisedButton(
                child: Text("取り消し"),
                onPressed: () {},
                highlightElevation: 16.0,
                highlightColor: Colors.blue,
                onHighlightChanged: (value) {},
              ) : Container(),),
            ]),
            (is_ok) ? RaisedButton(
              child: Text("登録"),
              onPressed: () {},
              highlightElevation: 16.0,
              highlightColor: Colors.blue,
              onHighlightChanged: (value) {},
            ) : Text('音声を入力してください'),
          ],
        ),
      ),
    );
  }
}