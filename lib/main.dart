import 'package:flutter/material.dart';
import 'record.dart';
import 'footer.dart';
import 'qr_reader.dart';
import 'media_play.dart';

import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(color: Colors.red,);
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            routes: {
              'record_root': (context) => RecordWidget(),
              //'mediaplay': (context) => MediaPlay(media),
            },
            title: 'AugmentedPostcard',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.blueGrey[900],
            ),
            home: RootWidget(),
          );
        }
        return Container(color: Colors.white,);
      },
    );
  }
}
