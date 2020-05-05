import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: Scaffold(
        appBar: AppBar(title: Text("After todo")),
        body: TodoApp(),
      ),
    );
  }
}

class TodoApp extends StatefulWidget {
  TodoApp({Key key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<String> lists = [];
  void insert(String text) {
    setState(() {
      lists.insert(0, text);
    });
  }

  void delete(int index) {
    setState(() {
      lists.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InputScreen(insert: insert),
          Expanded(
            child: ListScreen(lists: lists, onDelete: delete),
          ),
        ],
      ),
    );
  }
}

typedef TodoDeleteCallback = void Function(int);

class ListScreen extends StatelessWidget {
  ListScreen({@required this.lists, this.onDelete});

  final List<String> lists;
  final TodoDeleteCallback onDelete;

  Widget _buildItem(BuildContext context, int idx) {
    final item = lists[idx];
    return TodoTile(text: item, index: idx, onDelete: onDelete);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemCount: lists.length,
        itemBuilder: _buildItem,
        separatorBuilder: (context, idx) {
          return Divider();
        },
      ),
    );
  }
}

class TodoTile extends StatelessWidget {
  TodoTile({@required this.text, @required this.index, this.onDelete});
  final String text;
  final int index;
  final TodoDeleteCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.event),
      title: Text(text),
      subtitle: Text('안할꺼면서 적어두는 리스트'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.check_box_outline_blank),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red[300]),
            onPressed: () => onDelete(index),
          )
        ],
      ),
    );
  }
}

typedef InputInsertCallback = void Function(String);

class InputScreen extends StatelessWidget {
  InputScreen({@required this.insert});

  final InputInsertCallback insert;
  final controller = new TextEditingController();

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
              controller: controller,
              maxLength: 25,
              decoration: InputDecoration(
                  counterStyle: TextStyle(fontSize: 0),
                  hintText: "안할걸 알고 있지만 적어보거라",
                  border: InputBorder.none),
              onSubmitted: (text) {
                insert(text);
              },
            ),
          ),
          Flexible(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.add),
                color: Colors.blueGrey,
                onPressed: () {
                  insert(controller.text);
                  controller.clear();
                },
              )),
        ],
      ),
    );
  }
}
