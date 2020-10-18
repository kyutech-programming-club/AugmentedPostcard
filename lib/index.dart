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
            Expanded(flex: 4,
              child: Align(
                alignment: Alignment.center,
                child:  RichText(
                  text: TextSpan(style: TextStyle(color: Colors.black), children: [

                    TextSpan(text: 'AugmentedPostcardは葉書に',
                      style: TextStyle(
                      fontSize: 25.0,
                  )),
                    TextSpan(
                        text: '音声',
                        style: TextStyle(
                          fontSize: 27.0,
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                        )),
                    TextSpan(text: ' をつけることができるアプリです',
                        style: TextStyle(
                          fontSize: 25.0,
                        )),
                  ]),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                    '使い方',textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        height: 1.0
                    )
                ),
              ),
            ),
            Expanded(flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                    '葉書を送りたい時',textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        height: 2.0
                    )
                ),
              ),
            ),
            Expanded(flex: 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  '専用の葉書を購入してScanからQRコードを読み取ります\n次に音声を録音して登録を押すだけです',textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    height: 2.0
                  )
                ),
              ),
            ),
            Expanded(flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                    '葉書を受け取る時',textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        height: 2.0
                    )
                ),
              ),
            ),
            Expanded(flex: 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'ScanからQRコードを読み取るだけです', textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    height: 2.0,
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}