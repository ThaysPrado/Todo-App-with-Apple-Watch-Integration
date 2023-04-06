import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  final _todoBox = Hive.box('todoBox');

  void createInitialData() {
    toDoList = [
      ["Test Todo List App", true],
      ["Slide me to left to delete", false],
    ];
  }

  void loadData() {
    toDoList = _todoBox.get("TODOLIST");
  }

  void updateDataBase() {
    _todoBox.put("TODOLIST", toDoList);
  }
}
