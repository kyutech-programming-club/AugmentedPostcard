import 'package:flutter/material.dart';
import 'record.dart';
import 'footer.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'record_root': (context) => RecordWidget(),
      },
      title: 'AugmentedPostcard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey[900],
      ),
      home: RootWidget(),
    );
  }
}
