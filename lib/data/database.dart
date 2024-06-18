import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];

  // reference the hive box
  final _myBox = Hive.box("myBox");

  // run this method if this is the 1st time opening this app
  void createInitialData() {
    toDoList = [
      ["read", false],
      ["eat", false],
    ];
  }

  // load the data from database

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update
  void updateData() {
    /// The `_myBox.put('TODOLIST', toDoList)` method is updating the data stored in the Hive box named
    /// "myBox". It is specifically updating the value associated with the key 'TODOLIST' with the
    /// contents of the `toDoList` list. This operation will replace the existing data associated with
    /// the key 'TODOLIST' with the updated `toDoList` data in the Hive box.
    _myBox.put("TODOLIST", toDoList);
  }
}
