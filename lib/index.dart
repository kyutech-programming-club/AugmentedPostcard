import 'package:flutter/material.dart';

class IndexWidget extends StatefulWidget {
  IndexWidget({Key key}) : super(key: key);


  @override
  _IndexWidgetState createState() => _IndexWidgetState();
}

class _IndexWidgetState extends State<IndexWidget> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('AugmentedPostcard'),
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