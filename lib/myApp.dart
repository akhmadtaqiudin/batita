import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Welcome to BATITA App'),
      ),
      body: new Center(
        child: new Text(
            'Hello, world!'
        ),
      ),
    );
  }
}