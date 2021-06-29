import 'package:action_broadcast/action_broadcast.dart';
import 'package:broadcast_demo/second_secreen.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with AutoCancelStreamMixin{
  String editableText='';

  //Todo set Receiver
  @override
  Iterable<StreamSubscription> get registerSubscriptions sync* {
    yield registerReceiver([Constants.actionReceiver]).listen((intent) {
      print("Receiver: "+intent.action);
      //Todo when actionReceiver fire then call this code
      if(intent.action == Constants.actionReceiver){

        String data = intent.extras['data'];

        setState(() {
          editableText = data;
        });
      }

    },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Broadcast Receiver")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(editableText.isEmpty?"Want To Change Text?":editableText),
            ),
            RaisedButton(
                color: Colors.blue,
                child: const Text("Second Screen"),
                onPressed: () {
                  //Todo Navigate to second screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
