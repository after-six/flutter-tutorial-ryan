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
            title: Text('No constraints'),
          ),
          body: ConstrainedBox()),
    );
  }
}

class ConstrainedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(child: const Text('Hello World!'), color: Colors.yellow),
    );
  }
}

class ExpandedLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expanded'),
        ),
        body: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.red),
                  ),
                  flex: 3),
              Expanded(
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.green),
                  ),
                  flex: 2),
              Expanded(
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.blue),
                  ),
                  flex: 1),
            ],
          ),
        ));
  }
}

class StackLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const iconSize = 50.0;
    return Scaffold(
        appBar: AppBar(title: Text('Stack')),
        body: LayoutBuilder(
          builder: (context, constraints) => Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Material(
                color: Colors.yellowAccent,
              ),
              Positioned(
                top: 0,
                child: Icon(Icons.star, size: iconSize),
              ),
              Positioned(
                top: constraints.maxHeight - iconSize,
                left: constraints.maxWidth - iconSize,
                child: Icon(Icons.call, size: iconSize),
              ),
            ],
          ),
        ));
  }
}

class InstrinsicLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('IntrinsicWidth')),
        body: Center(
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => {},
                  child: Text('Short'),
                ),
                RaisedButton(
                  onPressed: () => {},
                  child: Text('A bit Longer'),
                ),
                RaisedButton(
                  onPressed: () => {},
                  child: Text('The Longest text button'),
                ),
              ],
            ),
          ),
        ));
  }
}

class LayoutExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        mainAxisSize: MainAxisSize.min,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.star, size: 50),
          Icon(Icons.star, size: 50),
          Icon(Icons.star, size: 50),
        ],
      ),
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
