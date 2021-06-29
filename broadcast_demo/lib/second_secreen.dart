import 'package:broadcast_demo/third_screen.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                color: Colors.blue,
                child: const Text("Third Screen"),
                onPressed: () {
                  //Todo Navigate to third screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ThirdScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
