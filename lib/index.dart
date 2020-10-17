import 'package:flutter/material.dart';

class RootWidget extends StatefulWidget {
  RootWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {

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
              child: Text("つくる"),
              onPressed: () {
                Navigator.pushNamed(context, 'record_root');
              },
              highlightElevation: 16.0,
              highlightColor: Colors.blue,
              onHighlightChanged: (value) {},
            ),
            RaisedButton(
              child: Text("よみこむ"),
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