import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/utilites/dialog_box.dart';
import 'package:todo_app/utilites/todo_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
 //reference the hive box
 final _myBox = Hive.openBox("myBox");
 
 
 //text controller
 final _controller = TextEditingController();


 //list of todo tasks
  List toDoList = [
    ["Make Tutorial", false],
    ["Make Exercise", false]
  ];

   //checkbox was tapped
   void checkBoxChanged(bool? value, int index) {
      setState(() {
        toDoList[index][1] = !toDoList[index][1];
      });
   }


   //save new task
   void saveNewTask() {
    setState(() {
        toDoList.add([_controller.text, false]);
        _controller.clear();
       
    });
    Navigator.of(context).pop();
    
   }

   //create new task
   void createNewTask() {
      showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop()
             );
           },
        );
      } 

    //delete task
    void deleteTask(int index) {
        setState(() {
          toDoList.removeAt(index);
        });
    }
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.yellow[200],
       appBar: AppBar(
        title: Center(child: Text("TO DO")),
        elevation: 0,
       ),
       floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: createNewTask,
        child: Icon(Icons.add),),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
          taskName: toDoList[index][0], 
          taskComplete: toDoList[index][1], 
          onChanged: (value) => checkBoxChanged(value, index),
          deleteFunction: (context) => deleteTask(index),
          );
        },
        
      )
    );
  }
}

