import 'package:flutter/material.dart';

class MediaPlay extends StatelessWidget { // <- (※1)

  MediaPlay({Key key, String media}) : super(key: key);
  String media;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("play"), // <- (※2)
      ),
      body: Center(child: Text(this.media ?? "") // <- (※3)
      ),
    );
  }
}