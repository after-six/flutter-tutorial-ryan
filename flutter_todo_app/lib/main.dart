import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<String> lists = [
      "blablalbla",
      "blablalbla",
      "blablalbla",
      "blablalbla",
      "blablalbla",
      "blablalbla",
      "blablalbla",
      "blablalbla",
      "blablalbla",
    ];

    Widget buildTodoList(context) {
      return ListView.separated(
        itemCount: lists.length,
        itemBuilder: (context, idx) {
          final item = lists[idx];
          final no = idx + 1;
          return ListTile(
            leading: Icon(Icons.event),
            title: Text('$no : ' + item),
            subtitle: Text('안할꺼면서 적어두는 리스트'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.check_box_outline_blank),
                Icon(Icons.delete, color: Colors.red[300]),
              ],
            ),
          );
        },
        separatorBuilder: (context, idx) {
          return Divider();
        },
      );
    }

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: Text("After todo")),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TodoTextField(),
              Expanded(
                child: buildTodoList(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoTextField extends StatelessWidget {
  const TodoTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        border: Border.all(color: Colors.grey[300], width: 1),
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 9,
            child: TextField(
              maxLength: 25,
              decoration: InputDecoration(
                  counterStyle: TextStyle(fontSize: 0),
                  hintText: "안할걸 알고 있지만 적어보거라",
                  border: InputBorder.none),
            ),
          ),
          Flexible(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.add),
                color: Colors.blueGrey,
                onPressed: () {},
              )),
        ],
      ),
    );
  }
}
