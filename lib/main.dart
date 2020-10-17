import 'package:flutter/material.dart';
import 'index.dart';
import 'record.dart';
import 'footer.dart';
import 'qr_reader.dart';
import 'media_play.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'record_root': (context) => RecordWidget(),
        //'mediaplay': (context) => MediaPlay(media),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey[900],
      ),
      home: RootWidget(),
    );
  }
}
