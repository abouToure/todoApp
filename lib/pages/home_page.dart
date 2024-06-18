import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/data/database.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/toDo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// Reference the hive box
  // final _myBox = Hive.box("myBox");

// instanciation of ToDoDatabase
  // ToDoDatabase db = ToDoDatabase();

  //@override
  // void initState() {
  //   // if this is the first time ever opening the app then create default data
  //   if (_myBox.get("TODOLIST") == null) {
  //     db.createInitialData();
  //   } else {
  //     db.loadData();
  //   }
  //   super.initState();
  // }

//text controller
  final _controller = TextEditingController();

  List toDoList = [
    ["read", false],
    ["eat", false],
  ];

// checkbos was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      /**db.*/ toDoList[index][1] = !toDoList[index][1];
    });
    // db.updateData();
  }

// save task
  void saveTasks() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });

    Navigator.of(context).pop();
    // db.updateData();
  }

  void createTasks() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveTasks,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
    //db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("TO DO"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTasks,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
