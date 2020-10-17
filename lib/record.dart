import 'package:flutter/material.dart';

class RecordWidget extends StatefulWidget {
  RecordWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RecordWidgetState createState() => _RecordWidgetState();
}

class _RecordWidgetState extends State<RecordWidget> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("widget.title"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '',
            ),
        RaisedButton(
          child: Text("録音"),
          color: Colors.white,
          shape: CircleBorder(
            side: BorderSide(
              color: Colors.black,
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
          onPressed: () {},
        ),
            RaisedButton(
              child: Text("再生"),
              onPressed: () {},
              highlightElevation: 16.0,
              highlightColor: Colors.blue,
              onHighlightChanged: (value) {},
            ),
            RaisedButton(
              child: Text("取り消し"),
              onPressed: () {},
              highlightElevation: 16.0,
              highlightColor: Colors.blue,
              onHighlightChanged: (value) {},
            ),
            RaisedButton(
              child: Text("次へ"),
              onPressed: () {},
              highlightElevation: 16.0,
              highlightColor: Colors.blue,
              onHighlightChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}