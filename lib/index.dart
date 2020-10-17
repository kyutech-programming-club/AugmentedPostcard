import 'package:flutter/material.dart';

class IndexWidget extends StatefulWidget {
  IndexWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IndexWidgetState createState() => _IndexWidgetState();
}

class _IndexWidgetState extends State<IndexWidget> {

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
              '説明',
            ),
          ],
        ),
      ),
    );
  }
}