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
            title: Text('CrossAxisAlignment.stretch'),
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                LayoutExample1(),
                LayoutExample2(),
                // TextLayout()
              ],
          )),
    );
  }
}

class TextLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Text('Baseline', style: Theme.of(context).textTheme.display3),
          Text('Baseline', style: Theme.of(context).textTheme.body1),
        ],
      ),
    );
  }
}

class LayoutExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.star, size: 50),
          Icon(Icons.star, size: 200),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.star, size: 50),
          Icon(Icons.star, size: 200),
          Icon(Icons.star, size: 50),
        ],
      ),
    );
  }
}
