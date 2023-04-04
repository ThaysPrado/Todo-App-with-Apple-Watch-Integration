import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  final _todoBox = Hive.box('todoBox');

  void createInitialData() {
    toDoList = [
      ["Test Todo List App", true],
      ["Create a native widget", false],
    ];
  }

  void loadData() {
    toDoList = _todoBox.get("TODOLIST");
  }

  void updateDataBase() {
    _todoBox.put("TODOLIST", toDoList);
  }
}
