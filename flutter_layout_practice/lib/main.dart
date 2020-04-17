import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('MainAxisAlignment.spaceAround'),
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                LayoutExample1(),
                LayoutExample2(),
              ],
            ),
          )),
    );
  }
}

class LayoutExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(Icons.star, size: 50),
          Icon(Icons.star, size: 50),
          Icon(Icons.star, size: 50),
        ],
      ),
    );
  }
}

class LayoutExample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      constraints: BoxConstraints.expand(height: 400.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(Icons.star, size: 50),
          Icon(Icons.star, size: 50),
          Icon(Icons.star, size: 50),
        ],
      ),
    );
  }
}
