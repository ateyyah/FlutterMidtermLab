import 'dart:core';

import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

import '../ToDo.dart';

class ToDoModel extends ChangeNotifier {
  List<ToDo> _todos = [];
  List<ToDo> get to_dos => _todos;
  void refresh() {
    notifyListeners();
  }

  void setTodos(List<ToDo> newTodos) {
    _todos = newTodos;
    notifyListeners();
  }
}
