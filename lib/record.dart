import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecordWidget extends StatefulWidget {
  RecordWidget({Key key}) : super(key: key);

  @override
  _RecordWidgetState createState() => _RecordWidgetState();
}

class _RecordWidgetState extends State<RecordWidget> {
  bool is_ok = false;
  bool is_on = false;

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
            GestureDetector(
              onLongPress: () {
                if (!is_ok) {
                  print("ahi");
                  //録音開始
                  setState(() {
                    is_on = true;
                  });
                }
              },
              onLongPressUp: () {
                if (!is_ok) {
                  print("ahiahi");
                  //録音終了
                  setState(() {
                    is_ok = true;
                    is_on = false;
                  });
                }
              },
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: is_on && !is_ok ? Colors.pink[200] : null,
                  borderRadius: const BorderRadius.only(
                    topRight: const Radius.circular(75),
                    bottomRight: const Radius.circular(75),
                    topLeft: const Radius.circular(75),
                    bottomLeft: const Radius.circular(75),
                  ),
                ),
                //color: Colors.red,
                child: Icon(
                  Icons.keyboard_voice,
                  color: Colors.blue,
                  size: 100,
                ),
              ),
            ),
            Row(children: <Widget>[
              Expanded(child: (is_ok) ? RaisedButton(
                child: Text("再生"),
                onPressed: () {
                  //再生
                },
                highlightElevation: 16.0,
                highlightColor: Colors.blue,
                onHighlightChanged: (value) {},
              ) : Container(),),
              Expanded(child: (is_ok) ? RaisedButton(
                child: Text("取り消し"),
                onPressed: () {
                  //取り消し
                  setState(() {
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
              onPressed: () {
                //音声をデータベースに入れて、メモリから消す
              },
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