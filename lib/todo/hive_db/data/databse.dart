import 'package:hive/hive.dart';

class ToDoDataBase {
  //  List<List<dynamic>> toDo = [];
  // list of tasks
  List toDoList = [];

  // reference box
  final _mybox = Hive.box('SmartDoAI');

  // run on 1st time ever the app is opened
  void createInitialData() {
    toDoList = [
      [
        1,
        "Welcome to the world of organized tasking !",
        false,
        "Welcome to our Task Now AI app! We're thrilled that you've joined us and are eager to help you get started. Our app is designed to make your life easier and more productive, and we can't wait for you to experience it for yourself.",
      ],
      [
        2,
        "Task completed",
        true,
        "Switch left to delete then press delete button",
      ],
      [3, "Add new task", false, "Press the + icon to add new task"]
    ];
  }

  // load Data from hive
  void loadData() {
    toDoList = _mybox.get("TODOLIST");
  }

  // update database
  void updateDataBase() {
    _mybox.put("TODOLIST", toDoList);
  }
}
