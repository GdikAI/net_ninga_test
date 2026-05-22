import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  //reference our box
  final _myBox = Hive.openBox("myBox");
}