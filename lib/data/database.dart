import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  //reference our box
  final _myBox = Hive.box("myBox");

  //run this method if this is the 1st time opening this app
  void createInitialData() {
    toDoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false]
    ];
  }

  //load data from db
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update the db
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }

}