import 'package:action_broadcast/action_broadcast.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key key}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Third Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.black),
                    borderRadius: new BorderRadius.circular(25),
                  ),
                  hintText: 'Add data',
                  counterText: '',
                  hintStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black38),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.black),
                    borderRadius: new BorderRadius.circular(25),
                  ),
                ),
                maxLines: 2,
                minLines: 1,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            RaisedButton(
                color: Colors.blue,
                child: const Text("Pass data to 1st screen"),
                onPressed: () {
                  //Todo Navigate to third screen
                  sendBroadcast(Constants.actionReceiver, extras: {'data':_controller.text});
                }),
          ],
        ),
      ),
    );
  }
}
