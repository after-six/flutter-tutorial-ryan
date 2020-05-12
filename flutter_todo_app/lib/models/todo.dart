import 'package:flutter/material.dart';

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool done;

  Todo(this.userId, this.id, this.title, this.done);
}

class Todos extends ChangeNotifier {
  final List<Todo> _todos = [];

  void add(Todo todo) {
    _todos.insert(0, todo);
    notifyListeners();
  }

  void delete(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  Todo getItem(int index) {
    return _todos[index];
  }

  int length() {
    return _todos.length;
  }
}
